import Foundation

public extension Motif {
  enum Icon: CaseIterable {
    // MARK: - Events
    case release
    case fork
    case watch

    // MARK: - Objects
    case repository
    case author
    case organisation
    case releaseNotes

    // MARK: - Actions
    case star
  }
}

#if DEBUG
import SwiftUI

internal struct MotifIconPreviews: PreviewProvider {
  internal static var previews: some View {
    iconsList()
  }

  @ViewBuilder
  private static func iconsList() -> some View {
    List {
      ForEach(Motif.Icon.allCases, id: \.systemName) { icon in
        HStack {
          Image(systemName: icon.systemName)
            .font(.title)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .center)

          Text(String(describing: icon))
            .font(.body)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
      }
      .listRowSeparator(.hidden)
    }
  }
}
#endif
