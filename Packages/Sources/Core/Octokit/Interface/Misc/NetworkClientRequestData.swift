import Foundation

public extension Octokit {
  struct RequestCommonData {
    public typealias Headers = [String: String]
    public typealias QueryItems = [String: String]
    
    public let url: String
    public let method: URLRequest.HTTPMethod
    public let body: Encodable?
    public let headers: Headers?
    public let queryItems: QueryItems?
    
    public init(
      url: String,
      method: URLRequest.HTTPMethod,
      body: Encodable? = nil,
      headers: Headers? = nil,
      queryItems: QueryItems? = nil
    ) {
      self.url = url
      self.method = method
      self.body = body
      self.headers = headers
      self.queryItems = queryItems
    }
    
    public func appending(
      body: Encodable? = nil,
      headers: Headers? = nil,
      queryItems: QueryItems? = nil
    ) -> Octokit.RequestCommonData {
      Octokit.RequestCommonData(
        url: self.url,
        method: self.method,
        body: self.body,
        headers: self.headers + headers,
        queryItems: self.queryItems + queryItems
      )
    }
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

// TODO: fill + to Casimir
private func +<Key: Hashable, Value>(
  lhs: Dictionary<Key, Value>,
  rhs: Dictionary<Key, Value>
) -> Dictionary<Key, Value> {
  lhs
}
