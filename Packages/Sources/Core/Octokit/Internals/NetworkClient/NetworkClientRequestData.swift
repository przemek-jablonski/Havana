import Foundation

internal struct NetworkClientRequestData {
  internal let url: String
  internal let method: NetworkClientHTTPMethod
  internal let body: Encodable?
  internal let headers: Headers?
  internal let queryItems: QueryItems?
}

internal extension NetworkClientRequestData {
  typealias Headers = [String: String]
  typealias QueryItems = [String: String]
}
