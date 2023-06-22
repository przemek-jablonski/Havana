public struct Octokit {
  public var eventsService: () -> Octokit.EventsService
  public var loginService: () -> Octokit.LoginService
  public var userService: () -> Octokit.UserService

  public init(
    eventsService: @escaping () -> Octokit.EventsService,
    loginService: @escaping () -> Octokit.LoginService,
    userService: @escaping () -> Octokit.UserService
  ) {
    self.eventsService = eventsService
    self.loginService = loginService
    self.userService = userService
  }
}
