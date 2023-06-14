import Casimir

public extension Octokit {
  enum NetworkServiceError: ErrorProtocol {
    case privateAccessTokenFetchingFailed(Error)
    case networkRequestFailed(Error)
  }
}

public extension Octokit.NetworkServiceError {
  static func == (lhs: Octokit.NetworkServiceError, rhs: Octokit.NetworkServiceError) -> Bool {
    switch (lhs, rhs) {
    case (.privateAccessTokenFetchingFailed, .privateAccessTokenFetchingFailed):
      return true
    case (.networkRequestFailed, .networkRequestFailed):
      return true
    default:
      return false
    }
  }

  static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Octokit.NetworkServiceError {
    [
      .privateAccessTokenFetchingFailed(GenericError.random()),
      .networkRequestFailed(GenericError.random())
    ].random()
  }
}
