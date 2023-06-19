import Casimir
import Foundation

// swiftlint:disable redundant_string_enum_value
public extension Octokit {
  struct Milestone: ModelProtocol {
    public let closedAt: Date?
    public let closedIssues: Int
    public let createdAt: Date
    public let creator: UserBrief?
    public let description: String?
    public let dueOn: Date?
    public let htmlUrl: String
    public let id: Int
    public let labelsUrl: String
    public let nodeId: String?
    public let number: Int
    public let openIssues: Int
    public let state: State
    public let title: String
    public let updatedAt: Date
    public let url: String

    internal enum CodingKeys: String, CodingKey {
      case closedAt = "closed_at"
      case closedIssues = "closed_issues"
      case createdAt = "created_at"
      case creator = "creator"
      case description = "description"
      case dueOn = "due_on"
      case htmlUrl = "html_url"
      case id = "id"
      case labelsUrl = "labels_url"
      case nodeId = "node_id"
      case number = "number"
      case openIssues = "open_issues"
      case state = "state"
      case title = "title"
      case updatedAt = "updated_at"
      case url = "url"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        closedAt: .random(),
        closedIssues: .random(),
        createdAt: .random(),
        creator: .random(),
        description: .random(),
        dueOn: .random(),
        htmlUrl: .random(),
        id: .random(),
        labelsUrl: .random(),
        nodeId: .random(),
        number: .random(),
        openIssues: .random(),
        state: .random(),
        title: .random(),
        updatedAt: .random(),
        url: .random()
      )
    }
  }
}
// swiftlint:enable redundant_string_enum_value
