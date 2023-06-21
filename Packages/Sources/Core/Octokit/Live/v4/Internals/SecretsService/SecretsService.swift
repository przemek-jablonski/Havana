import Foundation

internal struct SecretsService {
  internal enum Entry {
    case privateAccessToken
  }

  var store: (
    _ entry: Entry,
    _ value: String
  ) async throws -> ()

  var retrieve: (
    _ entry: Entry
  ) async throws -> (String)
}
