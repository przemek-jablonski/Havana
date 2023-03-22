// import ComposableArchitecture
// import Octokit
// import SwiftUI
//
// internal struct LoginFlowSelectionView: View {
//  private let store: StoreOf<LoginFlowSelection>
//
//  internal init(
//    store: StoreOf<LoginFlowSelection>
//  ) {
//    self.store = store
//  }
//
//  internal var body: some View {
//    WithViewStore(self.store) { viewStore in
//      NavigationLink(
//        "Private Access Token",
//        destination: PrivateAccessTokenLoginView(
//          store: self.store.scope(
//            state: \.selection,
//            action: LoginFlowSelection.Action.privateAccessTokenFlow
//          )
//        )
//      )
//    }
//  }
// }
//
// internal struct LoginFlowSelectionView_Previews: PreviewProvider {
//  static var previews: some View {
//    LoginFlowSelectionView(
//      store: Store(
//        initialState: LoginFlowSelection.State.init(selection: .flowSelection),
//        reducer: LoginFlowSelection()
//      )
//    )
//  }
// }
