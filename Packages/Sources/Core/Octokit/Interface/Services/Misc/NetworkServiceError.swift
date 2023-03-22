import Casimir

public extension Octokit {
  enum NetworkServiceError: ErrorProtocol {
    case privateAccessTokenFetchingFailed(Error)
    case networkRequestFailed(Error)
  }
}

extension Octokit.NetworkServiceError {
  public static var allCases: [Octokit.NetworkServiceError] {
    [
      .privateAccessTokenFetchingFailed(EmptyError()),
      .networkRequestFailed(EmptyError())
    ]
  }

  public static var random: Octokit.NetworkServiceError {
    allCases.random
  }

  public static func == (lhs: Octokit.NetworkServiceError, rhs: Octokit.NetworkServiceError) -> Bool {
    switch (lhs, rhs) {
    case (.privateAccessTokenFetchingFailed, .privateAccessTokenFetchingFailed):
      return true
    case (.networkRequestFailed, .networkRequestFailed):
      return true
    default:
      return false
    }
  }
}
