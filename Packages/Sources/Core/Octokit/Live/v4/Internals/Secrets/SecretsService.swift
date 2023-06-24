import Foundation

internal struct SecretsService {
  internal enum Entry {
    case privateAccessToken
  }

  internal var store: (
    _ entry: Entry,
    _ value: String
  ) async throws -> ()

  internal var retrieve: (
    _ entry: Entry
  ) async throws -> (String)
}
