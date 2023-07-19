import ComposableArchitecture
import Foundation
import Octokit

extension Octokit: DependencyKey {
  public static let liveValue = {
    let secretsService = SecretsService.keychain()
    let networkClient = URLSessionGithubNetworkClient()

    let jsonDecoder = JSONDecoder.v4

    let rootService = Octokit.RootService.v4(
      secretsService: secretsService,
      networkClient: networkClient
    )

    let eventsDecoder = EventsDecoder.v4(
      jsonDecoder: jsonDecoder
    )

    return Self(
      eventsService: {
        Octokit.EventsService.v4(
          secretsService: secretsService,
          eventsDecoder: eventsDecoder,
          networkClient: networkClient
        )
      },
      loginService: {
        Octokit.LoginService.v4(
          secretsService: secretsService,
          rootService: rootService,
          networkClient: networkClient
        )
      },
      userService: {
        Octokit.UserService.v4(
          secretsService: secretsService,
          networkClient: networkClient
        )
      },
      repositoryService: {
        Octokit.RepositoryService.v4(
          secretsService: secretsService,
          networkClient: networkClient
        )
      }
    )
  }()
}

extension Octokit.EventsService: DependencyKey {
  public static let liveValue = Octokit.liveValue.eventsService()
}

extension Octokit.LoginService: DependencyKey {
  public static let liveValue = Octokit.liveValue.loginService()
}

extension Octokit.UserService: DependencyKey {
  public static let liveValue = Octokit.liveValue.userService()
  public static let previewValue = Self(user: { .random() })
}

extension Octokit.RepositoryService: DependencyKey {
  public static let liveValue = Octokit.liveValue.repositoryService()
  public static let previewValue = Self(
    repository: { _ in .random() },
    readme: { _ in .random() },
    languages: { _ in .random() }
  )
}
