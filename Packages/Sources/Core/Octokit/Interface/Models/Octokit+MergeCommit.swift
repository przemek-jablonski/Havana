import Casimir
import Foundation

public extension Octokit {
  /// The default value for a merge commit message.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `PR_BODY` - default to the pull request's body.
  /// - `BLANK` - default to a blank commit message.
  enum MergeCommitMessage: String, ModelProtocol {
    case blank = "BLANK"
    case prBody = "PR_BODY"
    case prTitle = "PR_TITLE"

    public var id: UUID { UUID() }
    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      [
        .blank,
        .prBody,
        .prTitle
      ]
      .random()
    }
  }
}

public extension Octokit {
  /// The default value for a merge commit title.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `MERGE_MESSAGE` - default to the classic title for a merge message (e.g., Merge pull
  /// request #123 from branch-name).
  ///
  /// The default value for a merge commit title.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `MERGE_MESSAGE` - default to the classic title for a merge message (e.g., Merge pull
  /// request #123 from branch-name).
  enum MergeCommitTitle: String, ModelProtocol {
    case mergeMessage = "MERGE_MESSAGE"
    case prTitle = "PR_TITLE"

    public var id: UUID { UUID() }
    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      [
        .mergeMessage,
        .prTitle
      ]
      .random()
    }
  }
}

public extension Octokit {
  /// The default value for a squash merge commit message:
  ///
  /// - `PR_BODY` - default to the pull request's body.
  /// - `COMMIT_MESSAGES` - default to the branch's commit messages.
  /// - `BLANK` - default to a blank commit message.
  enum SquashMergeCommitMessage: String, ModelProtocol {
    case blank = "BLANK"
    case commitMessages = "COMMIT_MESSAGES"
    case prBody = "PR_BODY"

    public var id: UUID { UUID() }
    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      [
        .blank,
        .commitMessages,
        .prBody
      ]
      .random()
    }
  }
}

public extension Octokit {
  /// The default value for a squash merge commit title:
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one commit) or the pull
  /// request's title (when more than one commit).
  enum SquashMergeCommitTitle: String, ModelProtocol {
    case commitOrPrTitle = "COMMIT_OR_PR_TITLE"
    case prTitle = "PR_TITLE"

    public var id: UUID { UUID() }
    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      [
        .commitOrPrTitle,
        .prTitle
      ]
      .random()
    }
  }
}
