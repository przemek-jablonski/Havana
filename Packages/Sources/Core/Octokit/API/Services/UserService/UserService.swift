import Combine

public protocol UserService {
  func receivedEvents(
    _ username: String,
    _ page: Int
  ) -> AnyPublisher<[ReceivedEvent], ReceivedEventsError>
}

public enum ReceivedEventsError: Error {
  case privateAccessTokenFetchingFailed(_ error: Error)
  case networkRequestFailed(_ error: Error)
  case contentDecodingFailed(_ error: Error)
}
