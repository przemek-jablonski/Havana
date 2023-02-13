import Foundation
import Combine

internal struct NetworkClient {
  enum Error: Swift.Error {
    case serverRequestConstructionFailed(error: Swift.Error?)
    case serverReturnedNonHTTPContent
    case serverReturnedBadStatusCode(code: Int)
    case internalNetworkClientFailure(error: Swift.Error)
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
