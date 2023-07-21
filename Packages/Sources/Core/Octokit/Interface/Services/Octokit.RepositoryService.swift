public extension Octokit {
  struct RepositoryService {
    /**
     Fetches the basic repository information using `fullName` (that is String consisting of `"{owner_name}/{repo_name}"`.
     */
    public var repository: (
      _ fullName: String
    ) async throws -> Octokit.Repository

    /**
     Fetches the readme object for given `repository`.
     */
    public var readme: (
      _ fullName: String
    ) async throws -> Octokit.Repository.Readme

    /**
     Fetches the list of languages used to construct given `repository`.
     */
    public var languages: (
      _ fullName: String
    ) async throws -> [Octokit.Repository.Language]

    public init(
      repository: @escaping (_ fullName: String) async throws -> Octokit.Repository,
      readme: @escaping (_ fullName: String) async throws -> Octokit.Repository.Readme,
      languages: @escaping (_ fullName: String) async throws -> [Octokit.Repository.Language]
    ) {
      self.repository = repository
      self.readme = readme
      self.languages = languages
    }
  }
}
