import Foundation
import Octokit

private let paginationEventsCount = 30

internal extension Octokit.EventsService {
  static func v4(
    secretsService: SecretsService,
    networkClient: GithubNetworkClient
  ) -> Self {
    Self(
      allPublicEvents: { page in
        try await networkClient.request(
          resource: .allPublicEvents(
            paginationEventsCount,
            page,
            try secretsService.retrieve(.privateAccessToken)
          )
        )
      },
      userEvents: { username, page in
        try await networkClient.request(
          resource: .userEvents(
            username,
            paginationEventsCount,
            page,
            try secretsService.retrieve(.privateAccessToken)
          )
        )
      }
    )
  }
}
