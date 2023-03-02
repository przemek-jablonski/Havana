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
          data: .receivedEvents(
            baseUrl: config.remoteBaseUrl,
            username: username,
            privateAccessToken: token,
            page: page
          ),
          type: [ReceivedEvent].self
        )
        .mapError(ReceivedEventsError.networkRequestFailed)
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
