import Foundation
import Octokit

extension Octokit.UserService {
  internal static func v4(
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
