import Foundation

public struct Octokit {
  var loginService: () -> LoginService
  var userService: () -> UserService
}
