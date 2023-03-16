import Casimir
import Combine
import Foundation
import Octokit

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
              Octokit.User.self,
              using: .user(
                config: config,
                privateAccessToken: token
              )
            )
            .mapError(NetworkServiceError.networkRequestFailed)
          }
      },
      receivedPublicEvents: { [secretsService, networkClient] (username, pageNumber) in
        secretsService.retrieve(.privateAccessToken)
          .subscribe(on: dispatchQueue)
          .mapError(NetworkServiceError.privateAccessTokenFetchingFailed)
          .flatMap { [networkClient] token in
            networkClient.request(
              [Octokit.UserReceivedPublicEvent].self,
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

private extension NetworkClientRequestData {
  static func user(
    config: Octokit.Config,
    privateAccessToken: String
  ) -> NetworkClientRequestData {
    config.commonRequestData(
      .init(
        endpoint: "/user",
        method: .get,
        token: privateAccessToken
      )
    )
  }
  
  static func receivedEvents(
    config: Octokit.Config,
    username: String,
    privateAccessToken: String,
    amount: Int = 100,
    page: Int
  ) -> NetworkClientRequestData {
    config.commonRequestData(
      .init(
        endpoint: "/users/\(username)/received_events/public",
        method: .get,
        token: privateAccessToken
      )
    )
    .appending(
      queryItems: [
        "per_page": amount.string,
        "page": page.string
      ]
    )
    
  }
}
