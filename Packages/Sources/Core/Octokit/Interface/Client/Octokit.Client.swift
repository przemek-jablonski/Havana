import Foundation

public extension Octokit {
  typealias Client = OctokitClient
}

/**
 Collection of Services that can be used to access the Github's remote data.
 */
public protocol OctokitClient {
  var loginService: Octokit.LoginService { get }
  var userService: Octokit.UserService { get }
}
