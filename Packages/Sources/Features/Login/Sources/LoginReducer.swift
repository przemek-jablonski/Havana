import ComposableArchitecture
import Foundation
import Octokit

public enum NavigationCommand: Equatable {
  case show
  case hide
}

public struct LoginReducer: ReducerProtocol {
  public struct State: Equatable {
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

  public enum Action: Equatable {
    public enum User: Equatable {
      case requestedPrivateAccessTokenFlow(NavigationCommand)
      case requestedOAuthLoginFlow(NavigationCommand)
    }

    public enum Local: Equatable {
      case privateAccessTokenLogin(PrivateAccessTokenLoginReducer.Action)
      case oAuthLogin(OAuthLoginReducer.Action)
    }

    public enum Delegate: Equatable {
      // TODO: implement this
      case userLoggedInSuccessfully
    }

    case user(User)
    case local(Local)
    case delegate(Delegate)
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
      case .local, .delegate:
        return .none
      }
    }
    .ifLet(
      \.privateAccessTokenLogin,
      action: CasePath<LoginReducer.Action, PrivateAccessTokenLoginReducer.Action>(
        embed: { local in
          LoginReducer.Action.local(.privateAccessTokenLogin(local))
        },
        extract: { action in
          switch action {
          case .local(.privateAccessTokenLogin(let action)):
            return action
          default:
            return nil
          }
        }
      )
    ) {
      PrivateAccessTokenLoginReducer(
        loginService: loginService
      )
    }
    .ifLet(
      \.oAuthLogin,
      action: CasePath<LoginReducer.Action, OAuthLoginReducer.Action>(
        embed: { local in
          LoginReducer.Action.local(.oAuthLogin(local))
        },
        extract: { action in
          switch action {
          case .local(.oAuthLogin(let action)):
            return action
          default:
            return nil
          }
        }
      )
    ) {
      OAuthLoginReducer()
    }
  }
}


// extension Store where Action: TCAFeatureAction {
//  func scope<ChildState, ChildAction>(
//    state toChildState: @escaping (State) -> ChildState,
//    action fromChildAction: CasePath<Action.InternalAction, ChildAction>
//  ) -> Store<ChildState, ChildAction> {
//    scope(
//      state: toChildState,
//      action: { ._internal(fromChildAction.embed($0)) }
//    )
//  }
// }

// store.scope(
//  state: \.settings,
//  action: /AppFeature.Action.InternalAction.userSettings
// )
