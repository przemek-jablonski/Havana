import Foundation

internal extension Octokit {
  static func api_2022_11_28() -> Self {
    let config: Config = .api_2022_11_28()
    let dispatchQueue: DispatchQueue = .global()
    let networkClient: NetworkClient = URLSessionNetworkClient(deserializer: GithubApiJsonDeserializer())
    let secretsService: SecretsService = KeychainSecretsService(dispatchQueue: .global())
    
    return Self(
      loginService: {
        LoginService.live(secretsService: secretsService)
      },
      userService: {
        UserService.live(
          config: config,
          dispatchQueue: dispatchQueue,
          networkClient: networkClient,
          secretsService: secretsService
        )
      }
    )
  }
}
