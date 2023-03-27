import Casimir
import ComposableArchitecture
import Octokit
import SwiftUI
import SwiftUINavigation

public protocol ComposableView: View {
  associatedtype State: ComposableState
  associatedtype Action: ComposableAction

  // TODO: force ViewState?
  // TODO: force ViewAction?

  var store: Store<State, Action> { get }

  init(_ store: Store<State, Action>)
}

public struct LoginView: ComposableView {
  public let store: StoreOf<LoginReducer>

  public init(
    _ store: StoreOf<LoginReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { viewStore in
      VStack {
        link(
          to: PrivateAccessTokenLoginView.init,
          drivenFrom: \.privateAccessTokenLogin,
          actions: LoginReducer.Action.privateAccessTokenLogin,
          onRequested: .user(.requestedPrivateAccessTokenFlow(.show)),
          onDismiss: .user(.requestedPrivateAccessTokenFlow(.hide)),
          viewStore: viewStore,
          store: store
        ) {
          Text("pat")
        }

        link(
          to: OAuthLoginView.init,
          drivenFrom: \.oAuthLogin,
          actions: LoginReducer.Action.oAuthLogin,
          onRequested: .user(.requestedOAuthLoginFlow(.show)),
          onDismiss: .user(.requestedOAuthLoginFlow(.hide)),
          viewStore: viewStore,
          store: store
        ) {
          Text("oauth")
        }
      }
    }
  }
}

private extension View {
  // swiftlint:disable_next function_parameter_count
  func link<
    State: Equatable,
    Action: Equatable,
    ScopedState: Equatable,
    ScopedAction: Equatable,
    Label: View,
    Destination: View
  >(
    to destination: @escaping (Store<ScopedState, ScopedAction>) -> Destination,
    drivenFrom scope: @escaping (State) -> ScopedState?,
    actions: @escaping (ScopedAction) -> Action,
    onRequested: Action,
    onDismiss: Action,
    viewStore: ViewStore<State, Action>,
    store: Store<State, Action>,
    label: @escaping () -> Label
  ) -> some View {
    NavigationLink(
      unwrapping: viewStore.binding(
        get: scope,
        send: { _ in onDismiss }
      )
      .removeDuplicates(),
      onNavigate: { if $0 { viewStore.send(onRequested) }},
      destination: { _ in
        IfLetStore(
          store.scope(
            state: scope,
            action: actions
          )
        ) {
          destination($0)
        }
      },
      label: label
    )
  }
}
