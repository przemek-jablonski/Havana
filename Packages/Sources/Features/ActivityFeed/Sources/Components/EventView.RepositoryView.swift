import Foundation
import SwiftUI

extension EventView {
  internal struct RepositoryView: View {

    internal var name: String
    internal var author: String?
    internal var description: String?

    internal var body: some View {
      VStack(alignment: .leading) {
        repositoryHeadline(
          name,
          author
        )

        repositoryDescription(
          description
        )
      }
    }
  }
}

extension EventView.RepositoryView {
  @ViewBuilder
  private func repositoryHeadline(
    _ name: String,
    _ author: String?
  ) -> some View {
    HStack(spacing: 0) {
      Image(icon: .repository)
        .font(.caption)
        .foregroundStyle(.secondary)

      VStack(alignment: .leading) {
        Text(name)
          .font(.body.monospaced())
          .scaleEffect(0.90)
          .foregroundStyle(.primary)

        if let author {
          Text(author)
            .font(.caption)
            .foregroundStyle(.secondary)
        }
      }
      .maxWidth(.infinity, alignment: .leading)
    }
  }

  @ViewBuilder
  private func repositoryDescription(
    _ description: String?
  ) -> some View {
    if let description {
      Text(description)
        .font(.caption)
        .padding(.vertical, 4)
        .padding(.horizontal)
        .lineLimit(3)
        .foregroundStyle(.secondary)
        .multilineTextAlignment(.leading)
        .maxWidth(.infinity, alignment: .leading)
    }
  }
}
