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

    /**
     Fetches the repository directory contents under given `path`.

     - Note: Fetching is performed only for given path (eg. repository root, given child directory etc) and it's 1-level deep ONLY.
     If the repository has 10 folders at the root (`/`) with 5 files each, then this endpoint will return only information regarding 10 root folders.

     - Parameter path: Path to inspect. Eg. `"/"` should be used for inspecting repository root. Use `"Examples/TicTacToe/tic-tac-toe/.gitignore"` for inspecting nested directories.
     */
    public var content: (
      _ fullName: String,
      _ path: String
    ) async throws -> [Octokit.Repository.Entity]

    public init(
      repository: @escaping (_ fullName: String) async throws -> Octokit.Repository,
      readme: @escaping (_ fullName: String) async throws -> Octokit.Repository.Readme,
      languages: @escaping (_ fullName: String) async throws -> [Octokit.Repository.Language],
      content: @escaping (_ fullName: String, _ path: String) async throws -> [Octokit.Repository.Entity]
    ) {
      self.repository = repository
      self.readme = readme
      self.languages = languages
      self.content = content
    }
  }
}
