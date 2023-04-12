import Casimir
import Foundation

public extension Octokit.Event {
  enum Payload: ModelProtocol {
    case commitCommentEventPayload(CommitCommentEventPayload)
    case createEventPayload(CreateEventPayload)
    case deleteEventPayload(DeleteEventPayload)
    case forkEventPayload(ForkEventPayload)
    case gollumEventPayload(GollumEventPayload)
    case issueCommentEventPayload(IssueCommentEventPayload)
    case issuesEventPayload(IssuesEventPayload)
    case memberEventPayload(MemberEventPayload)
    case publicEventPayload(PublicEventPayload)
    case pullRequestEventPayload(PullRequestEventPayload)
    case pushEventPayload(PushEventPayload)
    case releaseEventPayload(ReleaseEventPayload)
    case sponsorshipEventPayload(SponsorshipEventPayload)
    case watchEventPayload(WatchEventPayload)
    //    case pullRequestReviewEventPayload
    //    case pullRequestReviewCommentEventPayload
    //    case pullRequestReviewThreadEventPayload
  }
}

extension Octokit.Event.Payload: CaseIterable {
  public static var allCases: [Octokit.Event.Payload] {
    [
      .commitCommentEventPayload(.random),
      .createEventPayload(.random),
      .deleteEventPayload(.random),
      .forkEventPayload(.random),
      .gollumEventPayload(.random),
      .issueCommentEventPayload(.random),
      .issuesEventPayload(.random),
      .memberEventPayload(.random),
      .publicEventPayload(.random),
      .pullRequestEventPayload(.random),
      .pushEventPayload(.random),
      .releaseEventPayload(.random),
      .sponsorshipEventPayload(.random),
      .watchEventPayload(.random)
    ]
  }
}

extension Octokit.Event.Payload {
  public var id: UUID {
    switch self {
      case .commitCommentEventPayload(let payload): return payload.id
      case .createEventPayload(let payload): return payload.id
      case .deleteEventPayload(let payload): return payload.id
      case .forkEventPayload(let payload): return payload.id
      case .gollumEventPayload(let payload): return payload.id
      case .issueCommentEventPayload(let payload): return payload.id
      case .issuesEventPayload(let payload): return payload.id
      case .memberEventPayload(let payload): return payload.id
      case .publicEventPayload(let payload): return payload.id
      case .pullRequestEventPayload(let payload): return payload.id
      case .pushEventPayload(let payload): return payload.id
      case .releaseEventPayload(let payload): return payload.id
      case .sponsorshipEventPayload(let payload): return payload.id
      case .watchEventPayload(let payload): return payload.id
    }
  }

  public static var random: Octokit.Event.Payload {
    Self.allCases.random
  }
}

public extension Octokit.Event.Payload {
  struct CommitCommentEventPayload: ModelProtocol {
    public let id = UUID()

    /// The action performed. Can be created.
    let action: String

    /// The commit comment resource.
    let comment: Octokit.CommitComment

    enum CodingKeys: String, CodingKey {
      case action = "action"
      case comment = "comment"
    }

    public static var random: Self {
      Self(
        action: .random,
        comment: .random
      )
    }
  }
}

public extension Octokit.Event.Payload {
  struct CreateEventPayload: ModelProtocol {
    public let id = UUID()

    /// The git ref resource.
    let ref: String

    /// The type of Git ref object created in the repository. Can be either branch or tag.
    let refType: String

    /// The name of the repository's default branch (usually main).
    let masterBranch: String

    /// The repository's current description.
    let description: String

    enum CodingKeys: String, CodingKey {
      case ref = "ref"
      case refType = "ref_type"
      case masterBranch = "master_branch"
      case description = "description"
    }

    public static var random: Self {
      Self(
        ref: .random,
        refType: .random,
        masterBranch: .random,
        description: .random
      )
    }
  }
}

public extension Octokit.Event.Payload {
  struct DeleteEventPayload: ModelProtocol {
    public let id = UUID()

    /// The git ref resource.
    let ref: String

    /// The type of Git ref object created in the repository. Can be either branch or tag.
    let refType: String

    enum CodingKeys: String, CodingKey {
      case ref = "ref"
      case refType = "ref_type"
    }

    public static var random: Self {
      Self(
        ref: .random,
        refType: .random
      )
    }
  }
}

public extension Octokit.Event.Payload {
  struct ForkEventPayload: ModelProtocol {
    public let id = UUID()

    /// The created `Repository` resource.
    let forkee: Octokit.Repository

    enum CodingKeys: String, CodingKey {
      case forkee = "forkee"
    }

    public static var random: Self {
      Self(
        forkee: .random
      )
    }
  }
}

public extension Octokit.Event.Payload {
  struct GollumEventPayload: ModelProtocol {
    public let id = UUID()

    /// The pages that were updated.
    let pages: [String]

    enum CodingKeys: String, CodingKey {
      case pages = "pages"
    }

    public static var random: Self {
      Self(
        pages: .random
      )
    }
  }
}

public extension Octokit.Event.Payload {
  struct IssueCommentEventPayload: ModelProtocol {
    public let id = UUID()

    /// The action that was performed on the comment. Can be one of created, edited, or deleted.
    let action: String

    /// The previous version of the body if the action was edited.
    let changes: String?
    // let changes[body][from]:  string  /// The previous version of the body if the action was edited.

    /// The issue the comment belongs to.
    let issue: Octokit.Issue

    /// The comment itself.
    let comment: Octokit.IssueComment

    enum CodingKeys: String, CodingKey {
      case action = "action"
      case changes = "changes"
      case issue = "issue"
      case comment = "comment"
    }

    public static var random: Self {
      Self(
        action: .random,
        changes: .random,
        issue: .random,
        comment: .random
      )
    }
  }
}

public extension Octokit.Event.Payload {
  struct IssuesEventPayload: ModelProtocol {
    public let id = UUID()

    /// The action that was performed.
    let action: Action

    /// The issue itself.
    let issue: Octokit.Issue

    /// The changes to the issue if the action was edited.
    let changes: String?
    // let changes[title][from]  string  The previous version of the title if the action was edited.
    // let changes[body][from]  string  The previous version of the body if the action was edited.

    /// The optional user who was assigned or unassigned from the issue.
    let assignee: Octokit.UserBrief?

    /// The optional label that was added or removed from the issue.
    let label: Octokit.Label

    enum CodingKeys: String, CodingKey {
      case action = "action"
      case issue = "issue"
      case changes = "changes"
      case assignee = "assignee"
      case label = "label"
    }

    public static var random: Self {
      Self(
        action: .random,
        issue: .random,
        changes: .random,
        assignee: .random,
        label: .random
      )
    }
  }
}

public extension Octokit.Event.Payload.IssuesEventPayload {
  /// The action that was performed. Can be one of opened, edited, closed, reopened, assigned, unassigned, labeled, or unlabeled.
  enum Action: CaseIterable, Codable, Randomable {
    case opened
    case edited
    case closed
    case reopened
    case assigned
    case unassigned
    case labeled
    case unlabeled

    public static var random: Self {
      self.allCases.random
    }
  }
}

public extension Octokit.Event.Payload {
  struct MemberEventPayload: ModelProtocol {
    public let id = UUID()

    /// The action that was performed. Can be added to indicate a user accepted an invitation to a repository.
    let action: String

    /// The user that was added.
    let member: Octokit.UserBrief

    /// The changes to the collaborator permissions if the action was edited.
    let changes: String?

    enum CodingKeys: String, CodingKey {
      case action = "action"
      case member = "member"
      case changes = "changes"
    }

    public static var random: Self {
      Self(
        action: .random,
        member: .random,
        changes: .random
      )
    }
  }
}

public extension Octokit.Event.Payload {
  struct PublicEventPayload: ModelProtocol {
    public let id = UUID()

    public static var random: Self {
      Self()
    }
  }
}

public extension Octokit.Event.Payload {
  struct PullRequestEventPayload: ModelProtocol {

    public let id = UUID()

    /// The action that was performed. Can be one of opened, edited, closed, reopened, assigned, unassigned, review_requested, review_request_removed, labeled, unlabeled, and synchronize.
    public let action: String

    /// The pull request number.
    public let number: Int

    /// The pull request itself.
    public let pullRequest: Octokit.PullRequest

    // TODO: changes

    /// The reason the pull request was removed from a merge queue if the action was dequeued.
    public let reason: String

    enum CodingKeys: String, CodingKey {
      case action = "action"
      case number = "number"
      case pullRequest = "pull_request"
      case reason = "reason"
    }

    public static var random: Octokit.Event.Payload.PullRequestEventPayload {
      Self(
        action: .random,
        number: .random,
        pullRequest: .random,
        reason: .random
      )
    }
  }
}

// PullRequestReviewEvent
// PullRequestReviewCommentEvent
// PullRequestReviewThreadEvent

public extension Octokit.Event.Payload {
  struct PushEventPayload: ModelProtocol {

    public let id = UUID()

    /// Unique identifier for the push.
    public let pushId: Int

    /// The number of commits in the push.
    public let size: Int

    /// The number of distinct commits in the push.
    public let distinctSize: Int

    /// The full git ref that was pushed. Example: refs/heads/main.
    public let ref: String

    /// The SHA of the most recent commit on ref after the push.
    public let head: String

    /// The SHA of the most recent commit on ref before the push.
    public let before: String

    // TODO: commits  array  An array of commit objects describing the pushed commits. The array includes a maximum of 20 commits.

    enum CodingKeys: String, CodingKey {
      case pushId = "push_id"
      case size = "size"
      case distinctSize = "distinct_size"
      case ref = "ref"
      case head = "head"
      case before = "before"
    }

    public static var random: Octokit.Event.Payload.PushEventPayload {
      Self(
        pushId: .random,
        size: .random,
        distinctSize: .random,
        ref: .random,
        head: .random,
        before: .random
      )
    }
  }
}

public extension Octokit.Event.Payload {
  struct ReleaseEventPayload: ModelProtocol {

    public let id = UUID()

    /// The action that was performed. Can be published.
    public let action: String

    /// The release object.
    public let release: Octokit.Release

    // TODO: changes[body][from]  string  The previous version of the body if the action was edited.
    // TODO: changes[name][from]  string  The previous version of the name if the action was edited.

    enum CodingKeys: String, CodingKey {
      case action = "action"
      case release = "release"
    }

    public static var random: Octokit.Event.Payload.ReleaseEventPayload {
      Self(
        action: .random,
        release: .random
      )
    }
  }
}

public extension Octokit.Event.Payload {
  struct SponsorshipEventPayload: ModelProtocol {

    public let id = UUID()

    public static var random: Octokit.Event.Payload.SponsorshipEventPayload {
      Self()
    }
  }
}

public extension Octokit.Event.Payload {
  struct WatchEventPayload: ModelProtocol {

    public let id = UUID()

    public static var random: Octokit.Event.Payload.WatchEventPayload {
      Self()
    }
  }
}
