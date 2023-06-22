import Octokit

public extension Octokit {
  // swiftlint:disable identifier_name
  static let v4 = Octokit.instance
  // swiftlint:enable identifier_name

  static var instance: Self {
    let secretsService = SecretsService.keychain()
    let networkClient = URLSessionGithubNetworkClient()

    let rootService = Octokit.RootService.v4(
      secretsService: secretsService,
      networkClient: networkClient
    )

    return Self(
      eventsService: {
        Octokit.EventsService.v4(
          secretsService: secretsService,
          networkClient: networkClient
        )
      },
      loginService: {
        Octokit.LoginService.v4(
          secretsService: secretsService,
          rootService: rootService,
          networkClient: networkClient
        )
      },
      userService: {
        Octokit.UserService.v4(
          secretsService: secretsService,
          networkClient: networkClient
        )
      }
    )
  }
}

// public extension Octokit {
//  struct v4: Octokit.Client {
//
//    internal static let shared: Octokit.Client = Octokit.Client_API_2022_11_28()
//
//    internal let rootService: Octokit.RootService
//    internal let loginService: Octokit.LoginService
//    internal let userService: Octokit.UserService
//
//    internal init(
//      config: Octokit.Config = Octokit.Config_API_2022_11_28(),
//      secretsService: SecretsService = KeychainSecretsService(),
//      networkClient: NetworkClient = URLSessionNetworkClient(urlSessionInstance: .shared)
//    ) {
//
//      self.rootService = Octokit.RootService_API_2022_11_28(
//        config: config,
//        networkClient: networkClient
//      )
//
//      self.loginService = Octokit.LoginService_API_2022_11_28(
//        secretsService: secretsService,
//        rootService: rootService
//      )
//
//      self.userService = Octokit.UserService_API_2022_11_28(
//        config: config,
//        secretsService: secretsService,
//        networkClient: networkClient
//      )
//    }
//  }
// }
