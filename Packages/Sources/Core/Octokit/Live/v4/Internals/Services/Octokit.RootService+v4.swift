import Foundation
import Octokit

extension Octokit.RootService {
  internal static func v4(
    secretsService: SecretsService,
    networkClient: GithubNetworkClient
  ) -> Self {
    Self(
      root: { privateAccessToken in
        try await networkClient.request(
          resource: .root(privateAccessToken)
        )
      },
      validateToken: { privateAccessToken in
        let _: Octokit.Hyperlinks = try await networkClient.request(
          resource: .root(privateAccessToken)
        )
        return ()
      }
    )
  }
}
