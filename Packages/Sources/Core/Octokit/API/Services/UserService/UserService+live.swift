import Casimir
import Combine
import Foundation

internal extension Octokit.UserService {
  static func live(
    config: Octokit.Config,
    dispatchQueue: DispatchQueue,
    networkClient: NetworkClient,
    secretsService: SecretsService
  ) -> Octokit.UserService {
    Octokit.UserService(
      user: { [secretsService, networkClient] in
        secretsService.retrieve(.privateAccessToken)
          .subscribe(on: dispatchQueue)
          .mapError(NetworkServiceError.privateAccessTokenFetchingFailed)
          .flatMap { [networkClient] token in
            networkClient.request(
              User.self,
              using: .user(
                config: config,
                privateAccessToken: token
              )
            )
            .mapError(NetworkServiceError.networkRequestFailed)
          }
      },
      receivedEvents: { [secretsService, networkClient] (username, pageNumber) in
        secretsService.retrieve(.privateAccessToken)
          .subscribe(on: dispatchQueue)
          .mapError(NetworkServiceError.privateAccessTokenFetchingFailed)
          .flatMap { [networkClient] token in
            networkClient.request(
              [ReceivedEvent].self,
              using: .receivedEvents(
                config: config,
                username: username,
                privateAccessToken: token,
                page: pageNumber
              )
            )
            .mapError(NetworkServiceError.networkRequestFailed)
          }
      }
    )
  }
}
//
//internal struct GithubUserService {
//  private let config: Octokit.Config
//  private let dispatchQueue: DispatchQueue
//  private let networkClient: NetworkClient
//  private let secretsService: SecretsService
//
//  internal init(
//    config: Octokit.Config,
//    dispatchQueue: DispatchQueue,
//    networkClient: NetworkClient,
//    secretsService: SecretsService
//  ) {
//    self.config = config
//    self.dispatchQueue = dispatchQueue
//    self.networkClient = networkClient
//    self.secretsService = secretsService
//  }
//}
//
//extension GithubUserService: UserService {
//  func userMetadata() -> AnyPublisher<User, NetworkServiceError> {
//    secretsService
//      .retrieve(.privateAccessToken)
//      .subscribe(on: dispatchQueue)
//      .mapError(NetworkServiceError.privateAccessTokenFetchingFailed)
//      .flatMap { [networkClient] token in
//        networkClient.request(
//          User.self,
//          using: .user(
//            config: config,
//            privateAccessToken: token
//          )
//        )
//        .mapError(NetworkServiceError.networkRequestFailed)
//      }
//      .eraseToAnyPublisher()
//  }
//
//  public func receivedEvents(
//    _ username: String,
//    _ page: Int
//  ) -> AnyPublisher<[ReceivedEvent], NetworkServiceError> {
//    secretsService
//      .retrieve(.privateAccessToken)
//      .subscribe(on: dispatchQueue)
//      .mapError(NetworkServiceError.privateAccessTokenFetchingFailed)
//      .flatMap { [networkClient] token in
//        networkClient.request(
//          [ReceivedEvent].self,
//          using: .receivedEvents(
//            config: config,
//            username: username,
//            privateAccessToken: token,
//            page: page
//          )
//        )
//        .mapError(NetworkServiceError.networkRequestFailed)
//      }
//      .eraseToAnyPublisher()
//  }
//}

private extension NetworkClientRequestData {
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
