import Foundation

internal enum NetworkClientError: Error {
  case serverRequestConstructionFailed(error: Error?)
  case serverReturnedNonHTTPContent
  case serverReturnedInvalidStatusCode(code: Int)
  case internalNetworkClientFailure(error: Error)
  case serverResponseDeserializationFailure(error: Error)
}
