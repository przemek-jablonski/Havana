extension Octokit {
  public struct LoginService {
    /**
     Logs the user in by validating `privateAccessToken`.
     */
    public var login: (_ privateAccessToken: String) async throws -> Void

    /**
      Checks if user is currently logged in.
     */
    public var isLoggedIn: () async throws -> Bool
  }
}
