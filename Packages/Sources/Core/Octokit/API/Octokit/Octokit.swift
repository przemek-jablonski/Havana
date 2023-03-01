import Foundation

public struct Octokit {
  private let config: Config
  private let dispatchQueue: DispatchQueue
  private let networkClient: NetworkClient
  private let deserializer: Deserializer
  private let secretsService: SecretsService
  
  public static let shared = Octokit()
  
  public init(
    config: Config = .default,
    dispatchQueue: DispatchQueue = .global()
  ) {
    self.init(
      config: config,
      dispatchQueue: dispatchQueue,
      networkClient: URLSessionNetworkClient(urlSessionInstance: .shared),
      deserializer: GithubApiJsonDeserializer(),
      secretsService: KeychainSecretsService(dispatchQueue: dispatchQueue)
    )
  }
  
  internal init(
    config: Config = .default,
    dispatchQueue: DispatchQueue,
    networkClient: NetworkClient,
    deserializer: Deserializer,
    secretsService: SecretsService
  ) {
    self.config = config
    self.dispatchQueue = dispatchQueue
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
      config: config,
      dispatchQueue: dispatchQueue,
      networkClient: networkClient,
      deserializer: deserializer,
      secretsService: secretsService
    )
  }
}
