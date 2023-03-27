import ComposableArchitecture
import Foundation
import Octokit

// TODO: extract this
public enum NavigationCommand: Equatable {
  case show
  case hide
}

public protocol ComposableState: Equatable {}

public protocol ComposableAction: Equatable {
  associatedtype User
  associatedtype Local
  associatedtype Delegate

  static func user(_: User) -> Self
  static func local(_: Local) -> Self
  static func delegate(_: Delegate) -> Self
}

public protocol ComposableReducer: ReducerProtocol where State: ComposableState, Action: ComposableAction {
  associatedtype ComposableBody: ReducerProtocol<State, Action>
  var body: ComposableBody { get }
}

public struct LoginReducer: ComposableReducer {
  public struct State: ComposableState {
    public var privateAccessTokenLogin: PrivateAccessTokenLoginReducer.State?
    public var oAuthLogin: OAuthLoginReducer.State?

    public init(
      privateAccessTokenLogin: PrivateAccessTokenLoginReducer.State? = nil,
      oAuthLogin: OAuthLoginReducer.State? = nil
    ) {
      self.privateAccessTokenLogin = privateAccessTokenLogin
      self.oAuthLogin = oAuthLogin
    }
  }

  public enum Action: ComposableAction {
    public enum User: Equatable {
      case requestedPrivateAccessTokenFlow(NavigationCommand)
      case requestedOAuthLoginFlow(NavigationCommand)
    }

    public enum Local: Equatable {}

    public enum Delegate: Equatable {
      case userLoggedInSuccessfully
    }

    case user(User)
    case local(Local)
    case delegate(Delegate)

    case privateAccessTokenLogin(PrivateAccessTokenLoginReducer.Action)
    case oAuthLogin(OAuthLoginReducer.Action)
  }

  private let loginService: Octokit.LoginService

  public init(
    loginService: Octokit.LoginService
  ) {
    self.loginService = loginService
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .user(.requestedPrivateAccessTokenFlow(.show)):
        state.privateAccessTokenLogin = .tokenInputForm
        return .none
      case .user(.requestedPrivateAccessTokenFlow(.hide)):
        state.privateAccessTokenLogin = nil
        return .none
      case .user(.requestedOAuthLoginFlow(.show)):
        state.oAuthLogin = .init()
        return .none
      case .user(.requestedOAuthLoginFlow(.hide)):
        state.oAuthLogin = nil
        return .none
      case .privateAccessTokenLogin(.delegate(.userLoggedInSuccessfully)):
        return .send(.delegate(.userLoggedInSuccessfully))
      case .local, .delegate:
        return .none
      case .privateAccessTokenLogin, .oAuthLogin:
        return .none
      }
    }
    .ifLet(
      \.privateAccessTokenLogin,
      action: /Action.privateAccessTokenLogin
    ) {
      PrivateAccessTokenLoginReducer(
        loginService: loginService
      )
    }
    .ifLet(
      \.oAuthLogin,
      action: /Action.oAuthLogin
    ) {
      OAuthLoginReducer()
    }
  }
}
