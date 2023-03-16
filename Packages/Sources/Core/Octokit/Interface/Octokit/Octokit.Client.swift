import Foundation

public extension Octokit {
  typealias Client = OctokitClient
}

public protocol OctokitClient {
  var loginService: Octokit.LoginService { get }
  var userService: Octokit.UserService { get }
}
