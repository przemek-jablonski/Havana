import Foundation

internal struct NetworkClientRequestData {
  internal typealias Headers = [String: String]
  internal typealias QueryItems = [String: String]
  
  internal let url: String
  internal let method: NetworkClientHTTPMethod
  internal let body: Encodable?
  internal let headers: Headers?
  internal let queryItems: QueryItems?
  
  internal init(
    url: String,
    method: NetworkClientHTTPMethod,
    body: Encodable? = nil,
    headers: NetworkClientRequestData.Headers? = nil,
    queryItems: NetworkClientRequestData.QueryItems? = nil
  ) {
    self.url = url
    self.method = method
    self.body = body
    self.headers = headers
    self.queryItems = queryItems
  }
  
  internal func appending(
    body: Encodable? = nil,
    headers: Headers? = nil,
    queryItems: QueryItems? = nil
  ) -> NetworkClientRequestData {
    NetworkClientRequestData(
      url: self.url,
      method: self.method,
      body: self.body,
      headers: self.headers + headers,
      queryItems: self.queryItems + queryItems
    )
  }
}

private func + (
  lhs: [String: String]?,
  rhs: [String: String]?
) -> [String: String] {
  var updated = lhs ?? [:]
  rhs?.forEach { (key, value) in
    updated[key] = value
  }
  return updated
}

private func +<Key: Hashable, Value>(
  lhs: Dictionary<Key, Value>,
  rhs: Dictionary<Key, Value>
) -> Dictionary<Key, Value> {
  lhs
}
