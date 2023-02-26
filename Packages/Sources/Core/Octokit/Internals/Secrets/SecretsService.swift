import Combine
import Foundation

internal protocol SecretsService {
  func store(_ entry: SecretsServiceEntry, value: String) -> AnyPublisher<Void, StoreError>
  func retrieve(_ entry: SecretsServiceEntry) -> AnyPublisher<String, RetrieveError>
}

internal enum SecretsServiceEntry {
  case privateAccessToken
}

enum StoreError: Error {
  case internalKeychainError(error: Error)
}

enum RetrieveError: Error {
  case entryNotFoundInKeychain(entry: SecretsServiceEntry)
  case internalKeychainError(error: Error)
}

