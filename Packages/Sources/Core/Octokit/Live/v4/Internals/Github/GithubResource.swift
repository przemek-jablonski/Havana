import Foundation

internal enum GithubResource {
  /**
   Root of the API. Hyperlinks for other resources.
   */
  case root(
        _ privateAccessToken: String?
       )

  /**
   User data for currently authenticated user.
   */
  case user(
        _ privateAccessToken: String
       )

  /**
   Public events from all Github users.
   */
  case allPublicEvents(
        _ eventsPerPage: Int = 30,
        _ page: Int = 1,
        _ privateAccessToken: String
       )

  /**
   These are events that you've received by watching repos and following users.
   If you are authenticated as the given user, you will see private events.
   Otherwise, you'll only see public events.
   */
  case userEvents(
        _ username: String,
        _ eventsPerPage: Int = 30,
        _ page: Int = 1,
        _ privateAccessToken: String
       )
}

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
