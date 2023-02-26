import Foundation

public struct Octokit {
  private let config: Config
  private let networkClient: NetworkClient
  private let deserializer: Deserializer
  private let secretsService: SecretsService
  
  public init(
    config: Config = .default
  ) {
    self.init(
      config: config,
      networkClient: URLSessionNetworkClient(urlSessionInstance: .shared),
      deserializer: GithubApiJsonDeserializer(),
      secretsService: KeychainSecretsService()
    )
  }
  
  internal init(
    config: Config = .default,
    networkClient: NetworkClient,
    deserializer: Deserializer,
    secretsService: SecretsService
  ) {
    self.config = config
    self.networkClient = networkClient
    self.deserializer = deserializer
    self.secretsService = secretsService
  }
  
  public var loginService: LoginService {
    GithubLoginService(
      networkClient: networkClient,
      deserializer: deserializer,
      secretsService: secretsService
    )
  }
  
  public var userService: UserService {
    GithubUserService(
      networkClient: networkClient,
      deserializer: deserializer
    )
  }
}
