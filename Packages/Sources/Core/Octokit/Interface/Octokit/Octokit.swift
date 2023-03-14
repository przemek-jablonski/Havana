import Foundation

public struct Octokit {
  public var loginService: () -> LoginService
  public var userService: () -> UserService
  
  internal init(
    loginService: @escaping () -> LoginService,
    userService: @escaping () -> UserService
  ) {
    self.loginService = loginService
    self.userService = userService
  }
}
