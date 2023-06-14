import Casimir
import Foundation

// swiftlint:disable discouraged_optional_boolean
public extension Octokit {
  struct Label: ModelProtocol {
    public let color: String?
    public let labelDefault: Bool?
    public let description: String?
    public let id: Int?
    public let name: String?
    public let nodeId: String?
    public let url: String?

    internal enum CodingKeys: String, CodingKey {
      case color = "color"
      case labelDefault = "label_default"
      case description = "description"
      case id = "id"
      case name = "name"
      case nodeId = "node_id"
      case url = "url"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        color: .random(),
        labelDefault: .random(),
        description: .random(),
        id: .random(),
        name: .random(),
        nodeId: .random(),
        url: .random()
      )
    }
  }
}
// swiftlint:enabled discouraged_optional_boolean
