import Foundation

public extension Motif.Icon {
  /**
   Returns given icon as SFSymbol identifier (ready to use eg. with `Image(systemName:)` inits).
   */
  var systemName: String {
    switch self {
    case .release: return "shippingbox"
    case .fork: return "square.on.square.dashed"
    case .watch: return "star"

    case .repository: return "folder"
    case .author: return "person"
    case .organisation: return "building"
    case .releaseNotes: return "note.text"

    case .star: return "star"
    }
  }
}
