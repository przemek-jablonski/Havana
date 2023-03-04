import Casimir
import Combine
import Foundation

internal struct GithubUserService {
  private let config: Octokit.Config
  private let dispatchQueue: DispatchQueue
  private let networkClient: NetworkClient
  private let secretsService: SecretsService
  
  internal init(
    config: Octokit.Config,
    dispatchQueue: DispatchQueue,
    networkClient: NetworkClient,
    secretsService: SecretsService
  ) {
    self.config = config
    self.dispatchQueue = dispatchQueue
    self.networkClient = networkClient
    self.secretsService = secretsService
  }
}

extension GithubUserService: UserService {
  func userMetadata() -> AnyPublisher<User, NetworkServiceError> {
    secretsService
      .retrieve(.privateAccessToken)
      .subscribe(on: dispatchQueue)
      .mapError(NetworkServiceError.privateAccessTokenFetchingFailed)
      .flatMap { [networkClient] token in
        networkClient.request(
          data: .user(
            config: config,
            privateAccessToken: token
          ),
          type: User.self
        )
        .mapError(NetworkServiceError.networkRequestFailed)
      }
      .eraseToAnyPublisher()
  }
  
  public func receivedEvents(
    _ username: String,
    _ page: Int
  ) -> AnyPublisher<[ReceivedEvent], NetworkServiceError> {
    secretsService
      .retrieve(.privateAccessToken)
      .subscribe(on: dispatchQueue)
      .mapError(NetworkServiceError.privateAccessTokenFetchingFailed)
      .flatMap { [networkClient] token in
        networkClient.request(
          data: .receivedEvents(
            config: config,
            username: username,
            privateAccessToken: token,
            page: page
          ),
          type: [ReceivedEvent].self
        )
        .mapError(NetworkServiceError.networkRequestFailed)
      }
      .eraseToAnyPublisher()
  }
}

extension NetworkClientRequestData {
  static func user(
    config: Octokit.Config,
    privateAccessToken: String
  ) -> NetworkClientRequestData {
    config.standardRequest(
      endpoint: "/user",
      method: .get,
      privateAccessToken: privateAccessToken
    )
  }
  
  static func receivedEvents(
    config: Octokit.Config,
    username: String,
    privateAccessToken: String,
    amount: Int = 100,
    page: Int
  ) -> NetworkClientRequestData {
    config.standardRequest(
      endpoint: "/users/\(username)/received_events/public",
      method: .get,
      privateAccessToken: privateAccessToken
    ).appending(
      queryItems: [
        "per_page": amount.string,
        "page": page.string
      ]
    )
  }
}
