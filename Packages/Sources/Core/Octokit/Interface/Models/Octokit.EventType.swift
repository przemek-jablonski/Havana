import Casimir

// https://medium.com/swlh/enums-with-decodable-in-swift-2bbc2ddddd6f

public extension Octokit {
  enum EventType: CaseIterable {
    /// A commit comment is created. The type of activity is specified in the action property of the payload object.
    case commitComment

    /// A Git branch or tag is created.
    case create

    /// A Git branch or tag is deleted.
    case delete

    /// A user forks a repository.
    case fork

    /// A wiki page is created or updated.
    case gollum

    /// Activity related to an issue or pull request comment. The type of activity is specified in the action property of the payload object.
    case issueComment

    /// Activity related to an issue. The type of activity is specified in the action property of the payload object.
    case issues

    /// Activity related to repository collaborators. The type of activity is specified in the action property of the payload object.
    case member

    /// When a private repository is made public.
    case `public`

    /// Activity related to pull requests. The type of activity is specified in the action property of the payload object.
    case pullRequest

    case pullRequestReview

    case pullRequestReviewComment

    case pullRequestReviewThread

    /// One or more commits are pushed to a repository branch or tag.
    case push

    /// Activity related to a release. The type of activity is specified in the action property of the payload object.
    case release

    /// Activity related to a sponsorship listing. The type of activity is specified in the action property of the payload object.
    case sponsorship

    /// When someone stars a repository. The type of activity is specified in the action property of the payload object.
    case watch

    case unknown(String)
  }
}

private extension Octokit.EventType {
  var string: String? {
    switch self {
    case .commitComment: return "CommitCommentEvent"
    case .create: return "CreateEvent"
    case .delete: return "DeleteEvent"
    case .fork: return "ForkEvent"
    case .gollum: return "GollumEvent"
    case .issueComment: return "IssueCommentEvent"
    case .issues: return "IssuesEvent"
    case .member: return "MemberEvent"
    case .public: return "PublicEvent"
    case .pullRequest: return "PullRequestEvent"
    case .pullRequestReview: return "PullRequestReviewEvent"
    case .pullRequestReviewComment: return "PullRequestReviewCommentEvent"
    case .pullRequestReviewThread: return "PullRequestReviewThreadEvent"
    case .push: return "PushEvent"
    case .release: return "ReleaseEvent"
    case .sponsorship: return "SponsorshipEvent"
    case .watch: return "WatchEvent"
    case .unknown: return nil
    }
  }
}

extension Octokit.EventType: ModelProtocol {
  public static var allCases: [Octokit.EventType] {
    [
      .commitComment,
      .create,
      .delete,
      .fork,
      .gollum,
      .issueComment,
      .issues,
      .member,
      .`public`,
      .pullRequest,
      .pullRequestReview,
      .pullRequestReviewComment,
      .pullRequestReviewThread,
      .push,
      .release,
      .sponsorship,
      .watch,
      .unknown("")
    ]
  }

  public static var random: Octokit.EventType {
    self.allCases.random
  }

  public var id: String {
    self.string ?? ""
  }

  // swiftlint:disable:next cyclomatic_complexity
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let status = try? container.decode(String.self)
    switch status {
    case Octokit.EventType.commitComment.string:
      self = .commitComment
    case Octokit.EventType.create.string:
      self = .create
    case Octokit.EventType.delete.string:
      self = .delete
    case Octokit.EventType.fork.string:
      self = .fork
    case Octokit.EventType.gollum.string:
      self = .gollum
    case Octokit.EventType.issueComment.string:
      self = .issueComment
    case Octokit.EventType.issues.string:
      self = .issues
    case Octokit.EventType.member.string:
      self = .member
    case Octokit.EventType.public.string:
      self = .public
    case Octokit.EventType.pullRequest.string:
      self = .pullRequest
    case Octokit.EventType.pullRequestReview.string:
      self = .pullRequestReview
    case Octokit.EventType.pullRequestReviewComment.string:
      self = .pullRequestReviewComment
    case Octokit.EventType.pullRequestReviewThread.string:
      self = .pullRequestReviewThread
    case Octokit.EventType.push.string:
      self = .push
    case Octokit.EventType.release.string:
      self = .release
    case Octokit.EventType.sponsorship.string:
      self = .sponsorship
    case Octokit.EventType.watch.string:
      self = .watch
    default:
      self = .unknown(status ?? "")
    }
  }
}
