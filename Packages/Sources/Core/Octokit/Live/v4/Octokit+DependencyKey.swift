import ComposableArchitecture
import Octokit

extension Octokit: DependencyKey {
  public static let liveValue = {
    let secretsService = SecretsService.keychain()
    let networkClient = URLSessionGithubNetworkClient()

    let rootService = Octokit.RootService.v4(
      secretsService: secretsService,
      networkClient: networkClient
    )

    return Self(
      eventsService: {
        Octokit.EventsService.v4(
          secretsService: secretsService,
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
