import ComposableArchitecture
import Foundation
import LoginFeature
import Octokit
import OctokitLive

public struct HavanaAppReducer: ReducerProtocol {
  public enum State: Equatable {
    case login(LoginReducer.State)
    case content
  }

  public enum Action: Equatable {
    case login(LoginReducer.Action)
  }

  private var loginService: Octokit.LoginService

  public init() {
    self.loginService = Octokit.instance.loginService
  }

  public var body: some ReducerProtocolOf<Self> {
    Reduce { _, action in
      switch action {
      default:
        return .none
      }
    }
    .ifCaseLet(
      /State.login,
      action: /Action.login
    ) {
      LoginReducer(
        loginService: loginService
      )
    }
  }
}
