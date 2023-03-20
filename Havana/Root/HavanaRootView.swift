import ComposableArchitecture
import LoginFeature
import SwiftUI

public struct HavanaRootView: View {
  private let store: StoreOf<Havana>

  public init(
    store: StoreOf<Havana>
  ) {
    self.store = store
  }

  public var body: some View {
    SwitchStore(self.store) {
      CaseLet(state: /Havana.State.login, action: Havana.Action.login) { store in
        NavigationView {
          LoginView(store: store)
        }
      }
    }
  }
}
