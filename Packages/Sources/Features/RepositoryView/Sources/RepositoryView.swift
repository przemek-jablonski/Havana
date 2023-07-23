import Casimir
import ComposableArchitecture
import Motif
import Octokit
import RepositoryExplorerFeature
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
      NavigationTitle(viewStore.displayName.ifEmpty(replaceWith: viewStore.fullName)) {
        List {
          content(viewStore.repository)
          content(viewStore.languages)
          Button {
            viewStore.send(.user(.userRequestedRepositoryFiles))
          } label: {
            Text("Files")
          }

          content(viewStore.readme)
        }
      }
      .task {
        viewStore.send(.user(.userNavigatedToRepositoryView))
      }
      .navigationDestination(
        store: self.store.scope(state: \.$repositoryExplorer, action: { ._repositoryExplorer($0) })
      ) { store in
        RepositoryExplorerView(store)
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
      //      List {
      Section {
        HStack {
          Image(systemName: "circle")
          Text(repository.owner.login)
        }
        Text(repository.fullName)
          .font(.title)
          .foregroundStyle(.primary)

        if let description = repository.description {
          Text(description)
            .foregroundStyle(.secondary)
        }

        Text("Stars: \(repository.stargazersCount.string)")
        Text("Forks: \(repository.forksCount)")
        Text("Watchers: \(repository.watchersCount)")

        if let topics = repository.topics {
          Text(topics.joined(separator: ", "))
        }

        if repository.visibility == "public" {
          HStack {
            Image(icon: .public)
            Text("Public")
          }
        }

        if repository.visibility == "private" {
          HStack {
            Image(icon: .private)
            Text("Private")
          }
        }

        if let homepage = repository.homepage, let homepageUrl = URL(string: homepage) {
          Link(homepage, destination: homepageUrl)
        }
      }

    //        // TODO: limit to x entries
    //        Section("Files") {
    //
    //        }
    //      }

    // topics array
    // visibility
    // homepage
    // LANGUAGE (?) / languages to download
    // main branch
    // archived
    // allows

    }
  }

  @ViewBuilder
  private func content(
    _ languages: Loadable<[Octokit.Repository.Language]>
  ) -> some View {
    if case Loadable.loaded(let languages) = languages {
      Section("Languages") {
        ForEach(languages) { language in
          Text(String(describing: language))
        }
      }
    }
  }

  @ViewBuilder
  private func content(
    _ readme: Loadable<Octokit.Repository.Readme>
  ) -> some View {
    if case Loadable.loaded(let readme) = readme {
      Section {
        if
          let data = Data(base64Encoded: readme.content, options: .ignoreUnknownCharacters),
          let content = try? String(data: data, encoding: .utf8).markdown {
          Text(content)
        }
      } header: {
        HStack {
          Image(icon: .file)
          Text(readme.name).monospaced()
        }
      }
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
