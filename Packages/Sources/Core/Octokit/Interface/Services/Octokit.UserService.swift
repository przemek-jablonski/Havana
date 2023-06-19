public extension Octokit {
  struct UserService {
    /**
     Fetches the user data for currently logged-in and authenticated user.
     */
    var user: () async throws -> Octokit.User
  }
}
