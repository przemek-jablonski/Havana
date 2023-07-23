import Octokit
import SwiftUI

internal extension RepositoryExplorerView {
  struct RepositoryEntityView: View {
    internal let entity: Octokit.Repository.Entity

    internal init(
      _ entity: Octokit.Repository.Entity
    ) {
      self.entity = entity
    }

    internal var body: some View {
      // TODO: wrap in Link or something
      HStack {
        if entity.type == "file" { // TODO: presentation logic in view
          Image(icon: .file)
            .imageScale(.medium)
            .monospaced()
        }

        if entity.type == "dir" { // TODO: presentation logic in view
          Image(icon: .directory)
            .imageScale(.medium)
            .monospaced()
        }

        Text(entity.name)

        Spacer()

        Image(icon: .linkChevron)
      }
    }
  }
}
