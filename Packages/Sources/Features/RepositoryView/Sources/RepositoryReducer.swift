import ComposableArchitecture
import Foundation
import Octokit

public struct RepositoryReducer: ReducerProtocol {
  public struct State: Equatable {
    internal var repository: Octokit.Repository
  }

  public enum Action: Equatable {
    public enum User: Equatable {
      case userNavigatedToRepositoryView
    }

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
      case .user(.userNavigatedToRepositoryView):
        return .none
      }
    }
  }
}
