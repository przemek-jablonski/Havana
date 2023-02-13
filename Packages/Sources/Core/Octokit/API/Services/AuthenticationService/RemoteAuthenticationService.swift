import Combine
//
//public extension Octokit {
//  struct RemoteAuthenticationService {
//    public static func instance() -> Octokit.AuthenticationService {
//      ...
//    }
//  }
//}

//public extension Octokit {
//  struct RemoteAuthenticationService {
////    private let api: Octokit.API
//
//    public init() {
//    }
//
//    public static func instance() -> Octokit.AuthenticationService {
////      let api = Octokit.API(token: "")
//      let remoteAuth = RemoteAuthenticationService(api: api)
//      remoteAuth.login(.init('a'))
//      return Octokit.AuthenticationService(login: remoteAuth.login)
//    }
//
//    public func login(_ token: Octokit.AuthenticationService.PrivateAccessToken) -> any Publisher<Void, Octokit.AuthenticationService.LoginError> {
//      return api.post(path: "authorizations", parameters: ["scopes": ["user"], "note": "My app login"], headers: ["Authorization": "Token \(token)"])
//        .flatMap { response in
//          let authorization = try JSONDecoder().decode(Authorization.self, from: response.data)
//          self.api.token = authorization.token
//          return Result.Publisher(Result.success(())).eraseToAnyPublisher()
//        }
//        .catch { error in
//          return Result.Publisher(Result.failure(Octokit.AuthenticationService.LoginError.invalidResponse)).eraseToAnyPublisher()
//        }
//    }
//  }
//}
