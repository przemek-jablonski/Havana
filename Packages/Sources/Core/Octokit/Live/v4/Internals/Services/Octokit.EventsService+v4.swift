import Foundation
import Octokit

private let paginationEventsCount = 30

extension Octokit.EventsService {
  internal static func v4(
    secretsService: SecretsService,
    eventsDecoder: EventsDecoder,
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
        try await eventsDecoder.decodeEvents(
          try await networkClient.request(
            resource: .userEvents(
              username,
              paginationEventsCount,
              page,
              try secretsService.retrieve(.privateAccessToken)
            )
          )
        )
      }
    )
  }
}
