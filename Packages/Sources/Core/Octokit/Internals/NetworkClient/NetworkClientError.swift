import Foundation

internal enum NetworkClientError: Swift.Error {
    case serverRequestConstructionFailed(error: Swift.Error?)
    case serverReturnedNonHTTPContent
    case serverReturnedInvalidStatusCode(code: Int)
    case internalNetworkClientFailure(error: Swift.Error)
}
