import Foundation

internal enum NetworkClientError: Error {
  case networkRequestFailure(Error)
  case responseDecodingFailure(Error)
}
