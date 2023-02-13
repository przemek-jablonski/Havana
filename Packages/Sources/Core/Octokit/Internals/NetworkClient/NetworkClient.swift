import Foundation
import Combine

internal struct NetworkClient {
  enum Error: Swift.Error {
    case unableToConstructRequest(error: Swift.Error?)
    case serverReturnedNonHTTPContent
    case serverReturnedBadStatusCode
    case serverReturnedGenericError(error: Swift.Error)
  }
  
  var get: (
    _ url: String,
    _ body: Encodable?,
    _ headers: [String: String],
    _ queryItems: [String: String]
  ) -> any Publisher<Data, NetworkClient.Error>
  
//  var post: (
//    _ url: String,
//    _ body: Encodable?,
//    _ headers: [String: String],
//    _ queryItems: [String: String]
//  ) -> any Publisher<Data, NetworkClient.Error>
}
