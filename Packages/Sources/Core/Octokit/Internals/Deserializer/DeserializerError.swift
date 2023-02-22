import Foundation

internal enum DeserializerError: Error {
    case internalDeserializationEngineError(targetType: Any, error: Error?)
}
