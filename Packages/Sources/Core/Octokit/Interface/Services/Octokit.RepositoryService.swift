public extension Octokit {
  struct RepositoryService {
    /**
     Fetches the basic repository information using `fullName` (that is String consisting of `"{owner_name}/{repo_name}"`.
     */
    public var repository: (
      _ fullName: String
    ) async throws -> Octokit.Repository

    public init(
      repository: @escaping (_ fullName: String) async throws -> Octokit.Repository
    ) {
      self.repository = repository
    }
  }
}
