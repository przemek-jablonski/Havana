public struct Octokit {
  public var loginService: () -> Octokit.LoginService
  public var userService: () -> Octokit.UserService
}
