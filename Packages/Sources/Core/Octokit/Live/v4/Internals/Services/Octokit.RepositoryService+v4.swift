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
      },
      readme: { fullName in
        try await networkClient.request(
          resource: .repositoryReadme(
            fullName,
            try secretsService.retrieve(.privateAccessToken)
          )
        )
      },
      languages: { fullName in
        let dictionary: [String: Int] = try await networkClient.request(
          resource: .repositoryLanguages(
            fullName,
            try secretsService.retrieve(.privateAccessToken)
          )
        )

        return dictionary.map { (key: String, value: Int) in
          Octokit.Repository.Language(name: key, bytes: value)
        }
      }
    )
  }
}
