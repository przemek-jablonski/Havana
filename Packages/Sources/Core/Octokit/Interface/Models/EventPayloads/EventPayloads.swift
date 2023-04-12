 import Casimir
 import Foundation

 public extension Octokit {
  struct CommitCommentEventPayload: ModelProtocol {
    public var id: String { comment.id.string + action }

    /// The action performed. Can be created.
    let action: String

    /// The commit comment resource.
    let comment: CommitComment

    public static var random: Self {
      Self(
        action: .random,
        comment: .random
      )
    }
  }
 }

 public extension Octokit {
  struct CreateEventPayload: ModelProtocol {
    public var id: String { ref }

    /// The git ref resource.
    let ref: String

    /// The type of Git ref object created in the repository. Can be either branch or tag.
    let refType: String

    /// The name of the repository's default branch (usually main).
    let masterBranch: String

    /// The repository's current description.
    let description: String

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

 public extension Octokit {
  struct DeleteEventPayload: ModelProtocol {
    public var id: String { ref }

    /// The git ref resource.
    let ref: String

    /// The type of Git ref object created in the repository. Can be either branch or tag.
    let refType: String

    public static var random: Self {
      Self(
        ref: .random,
        refType: .random
      )
    }
  }
 }

 public extension Octokit {
  struct ForkEventPayload: ModelProtocol {
    public var id: UUID { UUID() }

    /// The created `Repository` resource.
    let forkee: Repository

    public static var random: Self {
      Self(
        forkee: .random
      )
    }
  }
 }

 public extension Octokit {
  struct GollumEventPayload: ModelProtocol {
    public var id: UUID { UUID() }

    /// The pages that were updated.
    let pages: [String]

    public static var random: Self {
      Self(
        pages: .random
      )
    }
  }
 }

 public extension Octokit {
  struct IssueCommentEventPayload: ModelProtocol {
    public var id: String { issue.id.string + comment.id.string }

    /// The action that was performed on the comment. Can be one of created, edited, or deleted.
    let action: String

    /// The previous version of the body if the action was edited.
    let changes: String?
    // let changes[body][from]:  string  /// The previous version of the body if the action was edited.

    /// The issue the comment belongs to.
    let issue: Issue

    /// The comment itself.
    let comment: IssueComment

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

 public extension Octokit {
  struct IssuesEventPayload: ModelProtocol {
    public var id: UUID { UUID() }

    /// The action that was performed.
    let action: Action

    /// The issue itself.
    let issue: Issue

    /// The changes to the issue if the action was edited.
    let changes: String?
    // let changes[title][from]  string  The previous version of the title if the action was edited.
    // let changes[body][from]  string  The previous version of the body if the action was edited.

    /// The optional user who was assigned or unassigned from the issue.
    let assignee: User?

    /// The optional label that was added or removed from the issue.
    let label: Label

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

 public extension Octokit.IssuesEventPayload {
  /// The action that was performed. Can be one of opened, edited, closed, reopened, assigned, unassigned, labeled, or unlabeled.
  enum Action: CaseIterable, ModelProtocol {
    case opened
    case edited
    case closed
    case reopened
    case assigned
    case unassigned
    case labeled
    case unlabeled

    public var id: UUID { UUID() }
    public static var random: Octokit.IssuesEventPayload.Action {
      self.allCases.random
    }
  }
 }

 public extension Octokit {
  struct MemberEventPayload: ModelProtocol {
    public var id: UUID { UUID() }

    /// The action that was performed. Can be added to indicate a user accepted an invitation to a repository.
    let action: String

    /// The user that was added.
    let member: User

    /// The changes to the collaborator permissions if the action was edited.
    let changes: String?

    public static var random: Self {
      Self(
        action: .random,
        member: .random,
        changes: .random
      )
    }
  }
 }

 public extension Octokit {
  struct PublicEventPayload: ModelProtocol {
    public var id: UUID { UUID() }

    public static var random: Self {
      Self()
    }
  }
 }

// public extension Octokit {
//  /// Activity related to pull requests. The type of activity is specified in the action property of the payload object.
//  struct PublicEventPayload: ModelProtocol {
//    public var id: UUID { UUID() }
//
//    public static var random: Self {
//      Self()
//    }
//  }
// }

// action  string  The action that was performed. Can be one of opened, edited, closed, reopened, assigned, unassigned, review_requested, review_request_removed, labeled, unlabeled, and synchronize.
// number  integer  The pull request number.
// changes  object  The changes to the comment if the action was edited.
// changes[title][from]  string  The previous version of the title if the action was edited.
// changes[body][from]  string  The previous version of the body if the action was edited.
// pull_request  object  The pull request itself.
// reason  string  The reason the pull request was removed from a merge queue if the action was dequeued.
