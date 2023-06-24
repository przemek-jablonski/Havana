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
