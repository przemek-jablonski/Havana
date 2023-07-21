import Foundation

public extension Motif {
  enum Icon: CaseIterable {
    // MARK: - Events
    case release
    case watch

    // MARK: - Objects
    case repository
    case file
    case fork
    case author
    case organisation
    case releaseNotes
    case tag
    case issue
    case commit
    case pullRequest

    // MARK: - Actions
    case star
    case more
    case joinedProject
    case comment
    case contribution
    case delete
    case wiki
    case sponsorship

    // MARK: - Properties
    case `public`
    case `private`
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
