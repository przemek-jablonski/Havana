import SwiftUI

public extension Motif.Color {
  var color: Color {
    switch self {
    case .commit: return .brown
    case .create: return .green
    case .delete: return .red
    case .fork: return .purple
    case .wiki: return .pink
    case .issue: return .orange
    case .member: return .mint
    case .public: return .yellow
    case .pullRequest: return .pink
    case .push: return .teal
    case .release: return .green
    case .sponsorship: return .green
    case .watch: return .yellow
    }
  }
}
