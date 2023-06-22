import Casimir
import ComposableArchitecture
import Octokit
import SwiftUI
import SwiftUINavigation

public struct LoginView: View {
  public let store: StoreOf<LoginReducer>

  public init(
    _ store: StoreOf<LoginReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        link(
          to: PrivateAccessTokenLoginView.init,
          drivenFrom: \.privateAccessTokenLogin,
          actions: LoginReducer.Action.privateAccessTokenLogin,
          onRequested: .user(.requestedPrivateAccessTokenFlow(NavigationCommand.show)),
          onDismiss: .user(.requestedPrivateAccessTokenFlow(NavigationCommand.hide)),
          viewStore: viewStore,
          store: store
        ) {
          Text("pat")
        }

        link(
          to: OAuthLoginView.init,
          drivenFrom: \.oAuthLogin,
          actions: LoginReducer.Action.oAuthLogin,
          onRequested: .user(.requestedOAuthLoginFlow(NavigationCommand.show)),
          onDismiss: .user(.requestedOAuthLoginFlow(NavigationCommand.hide)),
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
  // swiftlint:disable function_parameter_count
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

private extension NavigationLink {
  init<
    State: Equatable,
    Action: Equatable,
    ScopedState: Equatable,
    ScopedAction: Equatable,
    WrappedView: View
  >(
    to destination: @escaping (Store<ScopedState, ScopedAction>) -> WrappedView,
    drivenFrom scope: @escaping (State) -> ScopedState?,
    actions: @escaping (ScopedAction) -> Action,
    onRequested: Action,
    onDismiss: Action,
    viewStore: ViewStore<State, Action>,
    store: Store<State, Action>,
    label: @escaping () -> Label
  ) where Destination == IfLetStore<ScopedState, ScopedAction, WrappedView?>? {
    self.init(
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
// swiftlint:enable function_parameter_count

internal struct LoginViewPreviews: PreviewProvider {
  internal static var previews: some View {
    LoginView(
      Store(
        initialState: LoginReducer.State(),
        reducer: LoginReducer(
          loginService: Octokit.LoginService(
            login: { _ in },
            isLoggedIn: { true }
          )
        )
      )
    )
  }
}
