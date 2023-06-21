import Foundation
import Octokit

internal struct NetworkRequestPayload {
  internal typealias Headers = [String: String]
  internal typealias QueryItems = [String: String]

  internal let url: String
  internal let httpMethod: String
  internal let body: Encodable?
  internal let headers: Headers?
  internal let queryItems: QueryItems?

  internal init(
    url: String,
    httpMethod: String,
    body: Encodable? = nil,
    headers: Headers? = nil,
    queryItems: QueryItems? = nil
  ) {
    self.url = url
    self.httpMethod = httpMethod
    self.body = body
    self.headers = headers
    self.queryItems = queryItems
  }
}
