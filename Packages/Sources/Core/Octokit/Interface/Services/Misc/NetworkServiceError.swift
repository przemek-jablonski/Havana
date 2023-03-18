import Casimir

public extension Octokit {
  enum NetworkServiceError: ErrorProtocol {
    case privateAccessTokenFetchingFailed(Error)
    case networkRequestFailed(Error)
    
    public static var allCases: [Octokit.NetworkServiceError] {
      [
        .privateAccessTokenFetchingFailed(EmptyError()),
        .networkRequestFailed(EmptyError())
      ]
    }
    
    public static var random: Octokit.NetworkServiceError {
      allCases.random
    }
  }
}
