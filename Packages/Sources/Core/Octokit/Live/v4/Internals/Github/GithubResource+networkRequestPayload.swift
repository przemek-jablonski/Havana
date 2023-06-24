import Foundation

extension GithubResource {
  internal var networkRequestPayload: NetworkRequestPayload {
    switch self {
    case .root(let privateAccessToken):
      return .githubRequest(
        endpoint: "/",
        httpMethod: "GET",
        token: privateAccessToken
      )
    case .allPublicEvents(
      let eventsPerPage,
      let page,
      let privateAccessToken
    ):
      return .githubRequest(
        endpoint: "/events",
        httpMethod: "GET",
        token: privateAccessToken,
        queryItems: [
          "per_page": eventsPerPage.string,
          "page": page.string
        ]
      )
    case .user(
      let privateAccessToken
    ):
      return .githubRequest(
        endpoint: "/user",
        httpMethod: "GET",
        token: privateAccessToken
      )
    case .userEvents(
      let username,
      let eventsPerPage,
      let page,
      let privateAccessToken
    ):
      return .githubRequest(
        endpoint: "/users/\(username)/received_events",
        httpMethod: "GET",
        token: privateAccessToken,
        queryItems: [
          "per_page": eventsPerPage.string,
          "page": page.string
        ]
      )
    }
  }
}
