import Foundation

public struct Octokit {
  var loginService: () -> LoginService
  var userService: () -> UserService
  
  public init(
    loginService: @escaping () -> LoginService,
    userService: @escaping () -> UserService
  ) {
    self.loginService = loginService
    self.userService = userService
  }
}
