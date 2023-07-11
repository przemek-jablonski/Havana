import Foundation

public extension Motif.Icon {
  /**
   Returns given icon as SFSymbol identifier (ready to use eg. with `Image(systemName:)` inits).
   */
  var systemName: String {
    switch self {
    case .release: return "shippingbox.fill"
    case .fork: return "square.filled.on.square"
    case .watch: return "star"

    case .repository: return "folder"
    case .author: return "person"
    case .organisation: return "building"
    case .releaseNotes: return "note.text"
    case .tag: return "tag"
    case .issue: return "envelope.open.fill"
    case .commit: return "text.line.first.and.arrowtriangle.forward"
    case .pullRequest: return "doc.text.fill"

    case .star: return "star.fill"
    case .more: return "ellipsis"
    case .joinedProject: return "person.2.fill"
    case .comment: return "bubble.left.fill"
    case .contribution: return "square.stack.3d.up"
    case .delete: return "delete.left.fill"
    case .wiki: return "books.vertical.fill"
    case .`public`: return "lock.open.fill"
    case .sponsorship: return "dollarsign.square.fill"
    }
  }
}
