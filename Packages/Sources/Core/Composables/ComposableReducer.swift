import ComposableArchitecture

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
