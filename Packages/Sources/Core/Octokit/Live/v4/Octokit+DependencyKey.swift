import ComposableArchitecture
import Octokit

extension Octokit: DependencyKey {
  public static var liveValue: Self {
    Octokit.instance
  }
}

extension Octokit.EventsService: DependencyKey {
  public static var liveValue: Self {
    Octokit.liveValue.eventsService()
  }
}

extension Octokit.LoginService: DependencyKey {
  public static var liveValue: Self {
    Octokit.liveValue.loginService()
  }
}

extension Octokit.UserService: DependencyKey {
  public static var liveValue: Self {
    previewValue
  }
}
