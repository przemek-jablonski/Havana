import Foundation
import Octokit

internal extension Octokit.UserService {
  static func v4(
    secretsService: SecretsService,
    networkClient: GithubNetworkClient
  ) -> Self {
    Self(
      user: {
        try await networkClient.request(
          resource: .user(try secretsService.retrieve(.privateAccessToken))
        )
      }
    )
  }
}
