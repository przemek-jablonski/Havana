import ComposableArchitecture

extension Octokit: TestDependencyKey {
  public static let testValue = Self(
    eventsService: unimplemented("\(Self.self).eventsService"),
    loginService: unimplemented("\(Self.self).loginService"),
    userService: unimplemented("\(Self.self).userService")
  )

  public static let previewValue = Self(
    eventsService: { .previewValue },
    loginService: { .previewValue },
    userService: { .previewValue }
  )
}

extension Octokit.EventsService: TestDependencyKey {
  public static let testValue = Self(
    allPublicEvents: unimplemented("\(Self.self).allPublicEvents"),
    userEvents: unimplemented("\(Self.self).userEvents")
  )

  public static let previewValue = Self(
    allPublicEvents: { _ in .random() },
    userEvents: { _, _ in .random() }
  )
}

extension Octokit.LoginService: TestDependencyKey {
  public static let testValue = Self(
    login: unimplemented("\(Self.self).login"),
    isLoggedIn: unimplemented("\(Self.self).isLoggedIn")
  )

  public static let previewValue = Self(
    login: { _ in },
    isLoggedIn: { .random() }
  )
}

extension Octokit.UserService: TestDependencyKey {
  public static var testValue: Self {
    Self(
      user: unimplemented("\(Self.self).user")
    )
  }

  public static var previewValue: Self {
    Self(
      user: { .random() }
    )
  }
}

public extension DependencyValues {
  var octokit: Octokit {
    get { self[Octokit.self] }
    set { self[Octokit.self] = newValue }
  }

  var eventsService: Octokit.EventsService {
    get { self[Octokit.EventsService.self] }
    set { self[Octokit.EventsService.self] = newValue }
  }

  var loginService: Octokit.LoginService {
    get { self[Octokit.LoginService.self] }
    set { self[Octokit.LoginService.self] = newValue }
  }

  var userService: Octokit.UserService {
    get { self[Octokit.UserService.self] }
    set { self[Octokit.UserService.self] = newValue }
  }
}
