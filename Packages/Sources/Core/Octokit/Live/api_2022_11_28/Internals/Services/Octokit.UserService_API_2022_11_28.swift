import Combine
import Foundation
import Octokit

internal extension Octokit {
  struct UserService_API_2022_11_28 {
    private let config: Octokit.Config
    private let secretsService: SecretsService
    private let networkClient: NetworkClient
    
    internal init(
      config: Octokit.Config,
      secretsService: SecretsService,
      networkClient: NetworkClient
    ) {
      self.config = config
      self.secretsService = secretsService
      self.networkClient = networkClient
    }
  }
}

extension Octokit.UserService_API_2022_11_28: Octokit.UserService {
  func user() async -> Result<Octokit.User, Octokit.NetworkServiceError> {
    await secretsService.retrieve(.privateAccessToken)
      .mapError(Octokit.NetworkServiceError.privateAccessTokenFetchingFailed)
      .flatMap { [networkClient] token in
        await networkClient.request(
          Octokit.User.self,
          using: .user(
            config: config,
            privateAccessToken: token
          )
        )
        .mapError(Octokit.NetworkServiceError.networkRequestFailed)
      }
  }
  
  func receivedPublicEvents(
    username: String,
    page: Int
  ) async -> Result<[Octokit.UserReceivedPublicEvent], Octokit.NetworkServiceError> {
    await secretsService.retrieve(.privateAccessToken)
      .mapError(Octokit.NetworkServiceError.privateAccessTokenFetchingFailed)
      .flatMap { [networkClient] token in
        await networkClient.request(
          [Octokit.UserReceivedPublicEvent].self,
          using: .receivedEvents(
            config: config,
            username: username,
            privateAccessToken: token,
            page: page
          )
        )
        .mapError(Octokit.NetworkServiceError.networkRequestFailed)
      }
  }
}

private extension Octokit.RequestCommonData {
  static func user(
    config: Octokit.Config,
    privateAccessToken: String
  ) -> Octokit.RequestCommonData {
    config.constructCommonRequestData(
      endpointUrl: "/user",
      method: .get,
      token: privateAccessToken
    )
  }
  
  static func receivedEvents(
    config: Octokit.Config,
    username: String,
    privateAccessToken: String,
    amount: Int = 100,
    page: Int
  ) -> Octokit.RequestCommonData {
    config.constructCommonRequestData(
      endpointUrl: "/users/\(username)/received_events/public",
      method: .get,
      token: privateAccessToken
    )
    .appending(
      queryItems: [
        "per_page": amount.string,
        "page": page.string
      ]
    )
  }
}
