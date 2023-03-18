import Octokit

internal extension Octokit {
  struct Client_API_2022_11_28: Octokit.Client {
    
    internal static let shared: Octokit.Client = Octokit.Client_API_2022_11_28()
    
    internal let loginService: Octokit.LoginService
    
    internal let userService: Octokit.UserService
    
    internal init(
      config: Octokit.Config = Octokit.Config_API_2022_11_28(),
      secretsService: SecretsService = KeychainSecretsService(),
      networkClient: NetworkClient = URLSessionNetworkClient(urlSessionInstance: .shared)
    ) {
      self.loginService = Octokit.LoginService_API_2022_11_28(
        secretsService: secretsService
      )
      
      self.userService = Octokit.UserService_API_2022_11_28(
        config: config,
        secretsService: secretsService,
        networkClient: networkClient
      )
    }
  }
}
