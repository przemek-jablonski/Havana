public struct Octokit {
  public var eventsService: () -> Octokit.EventsService
  public var loginService: () -> Octokit.LoginService
  public var userService: () -> Octokit.UserService
  public var repositoryService: () -> Octokit.RepositoryService

  public init(
    eventsService: @escaping () -> Octokit.EventsService,
    loginService: @escaping () -> Octokit.LoginService,
    userService: @escaping () -> Octokit.UserService,
    repositoryService: @escaping () -> Octokit.RepositoryService
  ) {
    self.eventsService = eventsService
    self.loginService = loginService
    self.userService = userService
    self.repositoryService = repositoryService
  }
}
