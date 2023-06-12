import Casimir
import Foundation

extension Octokit {
  /// License Simple
  public struct License: ModelProtocol {
    public let htmlUrl: String?
    public let key: String
    public let name: String
    public let nodeId: String?
    public let spdxId: String?
    public let url: String?

    enum CodingKeys: String, CodingKey {
      case htmlUrl = "html_url"
      case key = "key"
      case name = "name"
      case nodeId = "node_id"
      case spdxId = "spdx_id"
      case url = "url"
    }

    public let id = UUID()

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        htmlUrl: .random(),
        key: .random(),
        name: .random(),
        nodeId: .random(),
        spdxId: .random(),
        url: .random()
      )
    }
  }
}
