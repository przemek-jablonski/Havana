// import ComposableArchitecture
// import Octokit
// import SwiftUI
// import SwiftUINavigation
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
//    WithViewStore(store) { viewStore in
//      NavigationLink(
//        unwrapping: viewStore.$state, destination: <#T##(Binding<Value>) -> View#>, label: <#T##() -> _#>
////      NavigationLink(
////        "Private Access Token",
////        destination: PrivateAccessTokenLoginView(
////          store: self.store.scope(
////            state: \.selection,
////            action: LoginFlowSelection.Action.privateAccessTokenFlow
////          )
////        )
////      )
//    }
//  }
// }
//
// internal struct LoginFlowSelectionView_Previews: PreviewProvider {
// internal static var previews: some View {
//    LoginFlowSelectionView(
//      store: Store(
//        initialState: LoginFlowSelection.State.init(selection: .flowSelection),
//        reducer: LoginFlowSelection()
//      )
//    )
//  }
// }
