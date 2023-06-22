import ComposableArchitecture
import Foundation
import Octokit

public struct ___VARIABLE_scene_name___Reducer: ReducerProtocol {
  public struct State: Equatable {
    public init() {}
  }

  public enum Action: Equatable {
    public enum User: Equatable {}

    public enum Local: Equatable {}

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)
  }

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { _, action in
      switch action {
      case .user, .local, .delegate:
        return .none
      }
    }
  }
}
