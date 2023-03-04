import Foundation

internal enum NetworkClientError: Error {
  case serverRequestConstructionFailed(Error?)
  case serverReturnedNonHTTPContent
  case serverReturnedInvalidStatusCode(code: Int)
  case internalNetworkClientFailure(Error)
  case serverResponseDeserializationFailure(Error)
}
