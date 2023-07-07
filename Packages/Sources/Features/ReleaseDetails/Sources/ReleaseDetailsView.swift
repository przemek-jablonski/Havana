import Casimir
import ComposableArchitecture
import Motif
import SwiftUI

public struct ReleaseDetailsView: View {
  public let store: StoreOf<ReleaseDetailsReducer>
  private let formatter: RelativeDateTimeFormatter

  public init(
    _ store: StoreOf<ReleaseDetailsReducer>,
    formatter: RelativeDateTimeFormatter = RelativeDateTimeFormatter()
  ) {
    self.store = store
    self.formatter = formatter
  }

  // TODO: viewStore.release.payload.release is very weak (create intermediate model)
  public var body: some View {
    WithViewStore(store) { viewStore in
      List {
        Section {
          HStack {
            Image(systemName: "circle")
            Text(viewStore.release.actor.displayLogin)
            // navlink?
          }

          HStack {
            Text("Created ")
              +
              Text(formatter.localizedString(for: viewStore.release.createdAt, relativeTo: .now))
          }
          // TODO: prerelease, draft etc

          Text(viewStore.release.repository.name)

          Text(viewStore.release.payload.release.tagName)
        }

        if !viewStore.release.payload.release.assets.isEmpty, let url = viewStore.release.payload.release.assetsUrl.url {
          Section("Assets [\(viewStore.release.payload.release.assets.count)]") {
            Link(url.absoluteString, destination: url)
          }
        } else {
          Text("No release assets")
        }

        Section {
          if let body = try? viewStore.release.payload.release.body?.markdown {
            DisclosureGroup("Changelog") {
              Text(body)
                .font(.caption.monospaced())
            }
          }

          if let url = URL(string: viewStore.release.payload.release.htmlUrl) {
            Link(
              url.absoluteString,
              destination: url
            )
          }
        }
        .navigationTitle(viewStore.release.payload.release.tagName)
      }
      .toolbar {
        ToolbarItemGroup {
          Menu {
            Button("Other releases", icon: .release) {}
            Button(viewStore.release.repository.name, icon: .repository) {}
            Button(viewStore.release.actor.displayLogin, icon: .author) {}
          } label: {
            Label("More", icon: .more)
              .labelStyle(.iconOnly)
          }
        }
      }
    }
  }
}

#if DEBUG
public struct ReleaseDetailsViewPreviews: PreviewProvider {
  /// Primary preview for `ReleaseDetailsView`, shared with standalone preview app as well.
  public static var preview: some View {
    ReleaseDetailsView(
      Store(
        initialState: ReleaseDetailsReducer.State(
          release: .random()
        )
      ) {
        ReleaseDetailsReducer()
          ._printChanges()
      }
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
