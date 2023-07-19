import Casimir
import ComposableArchitecture
import Motif
import Octokit
import SwiftUI

public struct RepositoryView: View {
  public let store: StoreOf<RepositoryReducer>

  public init(
    _ store: StoreOf<RepositoryReducer>
  ) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      NavigationTitle(viewStore.displayName.ifEmpty(replaceWith: viewStore.fullName)) { [repository = viewStore.repository] in
        content(repository)
        //        switch repository {
        //          case .loading:
        //            Text(String(describing: repository))
        //          case .failure:
        //            Text(String(describing: repository))
        //          case .loaded(let repository):
        //            Text(String(describing: repository))
        //        }
      }
      .task {
        viewStore.send(.user(.userNavigatedToRepositoryView))
      }
    }
  }

  @ViewBuilder
  private func content(_ repository: Loadable<Octokit.Repository>) -> some View {
    switch repository {
    case .loading:
      Text(String(describing: repository))
    case .failure:
      Text(String(describing: repository))
    case .loaded(let repository):
      Text(String(describing: repository))
    // fullName
    // name
    // owner
    // description
    // forks / forksCount ?
    // stars
    // watchers
    // topics array
    // visibility
    // homepage
    // LANGUAGE (?) / languages to download
    // main branch
    // archived
    // allows

    }
  }
}

#if DEBUG
public struct RepositoryViewViewPreviews: PreviewProvider {
  /// Primary preview for `RepositoryViewView`, shared with standalone preview app as well.
  public static var preview: some View {
    RepositoryView(
      Store(
        initialState: .init(
          fullName: .random(),
          displayName: .random()
        )
      ) {
        RepositoryReducer()
          ._printChanges()
      }
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
