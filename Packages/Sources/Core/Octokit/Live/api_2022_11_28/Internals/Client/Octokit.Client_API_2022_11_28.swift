import Octokit

extension Octokit {
  internal struct Client_API_2022_11_28: Octokit.Client {

    internal static let shared: Octokit.Client = Octokit.Client_API_2022_11_28()

    internal let rootService: Octokit.RootService
    internal let loginService: Octokit.LoginService
    internal let userService: Octokit.UserService

    internal init(
      config: Octokit.Config = Octokit.Config_API_2022_11_28(),
      secretsService: SecretsService = KeychainSecretsService(),
      networkClient: NetworkClient = URLSessionNetworkClient(urlSessionInstance: .shared)
    ) {

      self.rootService = Octokit.RootService_API_2022_11_28(
        config: config,
        networkClient: networkClient
      )

      self.loginService = Octokit.LoginService_API_2022_11_28(
        secretsService: secretsService,
        rootService: rootService
      )

      self.userService = Octokit.UserService_API_2022_11_28(
        config: config,
        secretsService: secretsService,
        networkClient: networkClient
      )
    }
  }
}
