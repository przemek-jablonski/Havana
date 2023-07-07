import SwiftUI

public extension Motif.Font {
  var font: Font {
    switch self {
    case .title: return .title
    case .body: return .body
    case .caption: return .caption
    }
  }
}
