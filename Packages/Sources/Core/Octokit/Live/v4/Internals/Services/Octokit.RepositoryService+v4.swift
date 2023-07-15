import Foundation
import Octokit

private let paginationEventsCount = 30

extension Octokit.RepositoryService {
  internal static func v4(
    secretsService: SecretsService,
    networkClient: GithubNetworkClient
  ) -> Self {
    Self(
      repository: { fullName in
        try await networkClient.request(
          resource: .repository(
            fullName,
            try secretsService.retrieve(.privateAccessToken)
          )
        )
      }
    )
  }
}
