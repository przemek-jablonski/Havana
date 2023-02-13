import Casimir
import Combine
import Foundation

internal extension NetworkClient {
  static func urlSession(using urlSessionInstance: URLSession = .shared) -> Self {
    NetworkClient(
      get: { url, body, headers, queryItems in
        URLRequest.from(url, body, headers, queryItems)
          .mapError { NetworkClient.Error.unableToConstructRequest(error: $0) }
          .flatMap { request in
            urlSessionInstance
              .dataTaskPublisher(for: request)
              .mapError { NetworkClient.Error.serverReturnedGenericError(error: $0) }
          }
          .map { (data: Data, response: URLResponse) in data }
      }
    )
  }
}

private extension URLRequest {
  static func from(
    _ url: String,
    _ body: Encodable?,
    _ headers: [String: String],
    _ queryItems: [String: String]
  ) -> Result<Self, Error>.Publisher {
    .success(URLRequest(url: URL(string: url)!))
  }
}

//// TODO: refine this
//@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//  public func flatMap<T, P, E>(
//    maxPublishers: Subscribers.Demand = .unlimited,
//    publisher: @escaping (Self.Output) -> P,
//    mapError: @escaping (Self.Failure) -> E
//  ) -> any Publisher<T, E> where T == P.Output, P : Publisher, Self.Failure == P.Failure, E: Error {
//    self.flatMap { publisher($0).mapError(mapError) }
////      .flatMap(publisher)
////      .mapError(mapError)
//  }
//}
