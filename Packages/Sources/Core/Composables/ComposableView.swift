import ComposableArchitecture
import SwiftUI

public protocol ComposableView: View {
  associatedtype State: ComposableState
  associatedtype Action: ComposableAction

  // TODO: force ViewState?
  // TODO: force ViewAction?

  var store: Store<State, Action> { get }

  init(_ store: Store<State, Action>)
}
