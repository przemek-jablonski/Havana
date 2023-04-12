import Casimir
import Foundation

extension Octokit {
  public struct Payload: ModelProtocol {
    public let id: String?
    public let action: String?
    public let assignee: User?
    public let comment: IssueComment?
    public let description: String?
    public let issue: Issue?
    public let forkee: Repository?
    public let label: Label?
    public let pages: [Page]?
    public let ref: String?
    public let refType: String?
    public let number: Int?
    public let masterBranch: String?
    public let member: UserBrief?
    public let pullRequest: PullRequest?
    public let reason: String?
    public let release: Release?
    //    review
    //    changes
//    thread

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case action = "action"
      case assignee = "assignee"
      case comment = "comment"
      case description = "description"
      case issue = "issue"
      case forkee = "forkee"
      case label = "label"
      case pages = "pages"
      case ref = "ref"
      case refType = "ref_type"
      case number = "number"
      case masterBranch = "master_branch"
      case member = "member"
      case pullRequest = "pull_request"
      case reason = "reason"
      case release = "release"
    }

    public static var random: Self {
      Self(
        id: .random,
        action: .random,
        assignee: .random,
        comment: .random,
        description: .random,
        issue: .random,
        forkee: .random,
        label: .random,
        pages: .random,
        ref: .random,
        refType: .random,
        number: .random,
        masterBranch: .random,
        member: .random,
        pullRequest: .random,
        reason: .random,
        release: .random
      )
    }
  }
}

extension Octokit.Payload {
  // MARK: - Page
  public struct Page: ModelProtocol {
    public var id: String? { sha }
    public let action: String?
    public let htmlUrl: String?
    public let pageName: String?
    public let sha: String?
    public let summary: String?
    public let title: String?

    enum CodingKeys: String, CodingKey {
      case action = "action"
      case htmlUrl = "html_url"
      case pageName = "page_name"
      case sha = "sha"
      case summary = "summary"
      case title = "title"
    }

    public static var random: Self {
      Self(
        action: .random,
        htmlUrl: .random,
        pageName: .random,
        sha: .random,
        summary: .random,
        title: .random
      )
    }
  }
}
