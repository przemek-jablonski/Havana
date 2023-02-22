import Foundation
import Combine

internal struct NetworkClient {
  public typealias EndpointAddress = String
  public typealias Body = Encodable
  public typealias Headers = [String: String]
  public typealias QueryItems = [String: String]
  
  internal enum Error: Swift.Error {
    case serverRequestConstructionFailed(error: Swift.Error?)
    case serverReturnedNonHTTPContent
    case serverReturnedBadStatusCode(code: Int)
    case internalNetworkClientFailure(error: Swift.Error)
  }
  
  internal var get: (
    _ url: EndpointAddress,
    _ body: Body?,
    _ headers: Headers,
    _ queryItems: QueryItems
  ) -> any Publisher<Data, NetworkClient.Error>
  
//  var post: (
//    _ url: String,
//    _ body: Encodable?,
//    _ headers: [String: String],
//    _ queryItems: [String: String]
//  ) -> any Publisher<Data, NetworkClient.Error>
}
