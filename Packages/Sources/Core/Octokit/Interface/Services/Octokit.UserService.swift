public extension Octokit {
  struct UserService {
    /**
     Fetches the user data for currently logged-in and authenticated user.
     */
    public var user: () async throws -> Octokit.User

    public init(
      user: @escaping () async throws -> Octokit.User
    ) {
      self.user = user
    }
  }
}
