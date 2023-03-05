import Foundation

public struct RequestPayload {
  public let endpoint: String
  public let method: NetworkClientHTTPMethod
  public let token: String?
  
  public init(
    endpoint: String,
    method: NetworkClientHTTPMethod,
    token: String? = nil
  ) {
    self.endpoint = endpoint
    self.method = method
    self.token = token
  }
}
