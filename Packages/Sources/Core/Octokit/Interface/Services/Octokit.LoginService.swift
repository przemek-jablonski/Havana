public extension Octokit {
  struct LoginService {
    /**
     Logs the user in by validating `privateAccessToken`.
     */
    public var login: (_ privateAccessToken: String) async throws -> Void

    /**
     Checks if user is currently logged in.
     */
    public var isLoggedIn: () async -> Bool

    public init(
      login: @escaping (_ privateAccessToken: String) async throws -> Void,
      isLoggedIn: @escaping () async -> Bool
    ) {
      self.login = login
      self.isLoggedIn = isLoggedIn
    }
  }
}
