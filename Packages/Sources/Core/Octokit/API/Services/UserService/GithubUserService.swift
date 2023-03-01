import Casimir
import Combine
import Foundation

internal struct GithubUserService {
  private let config: Octokit.Config
  private let dispatchQueue: DispatchQueue
  private let networkClient: NetworkClient
  private let deserializer: Deserializer
  private let secretsService: SecretsService
  
  internal init(
    config: Octokit.Config,
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
}

extension GithubUserService: UserService {
  public func receivedEvents(
    _ username: String,
    _ page: Int
  ) -> AnyPublisher<[ReceivedEvent], ReceivedEventsError> {
    secretsService
      .retrieve(.privateAccessToken)
      .subscribe(on: dispatchQueue)
      .mapError(ReceivedEventsError.privateAccessTokenFetchingFailed)
      .flatMap { [networkClient] token in
        networkClient.request(
          .receivedEvents(
            baseUrl: config.remoteBaseUrl,
            username: username,
            privateAccessToken: token,
            page: page
          )
        )
        .mapError(ReceivedEventsError.networkRequestFailed)
      }
      .flatMap { [deserializer] response in
        deserializer.deserialize(
          response,
          into: [ReceivedEvent].self
        )
        .mapError(ReceivedEventsError.contentDecodingFailed)
      }
      .eraseToAnyPublisher()
  }
}

extension NetworkClientRequestData {
  static func receivedEvents(
    baseUrl: String,
    username: String,
    privateAccessToken: String,
    amount: Int = 100,
    page: Int
  ) -> NetworkClientRequestData {
    NetworkClientRequestData(
      url: "\(baseUrl)/users/\(username)/received_events/public",
      method: .get,
      body: nil,
      headers: [
        "Accept": "application/vnd.github+json",
        "Authorization": "Bearer \(privateAccessToken)",
        "X-GitHub-Api-Version": "2022-11-28"
      ],
      queryItems: [
        "per_page": amount.string,
        "page": page.string
      ]
    )
  }
}
