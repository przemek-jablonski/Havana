import Foundation
import KeychainAccess

private let octokitKeychainEntry = "com.octokit.keychain"

internal struct KeychainSecretsService {
  private let keychain: Keychain

  internal init(
    keychain: Keychain = Keychain(service: octokitKeychainEntry)
  ) {
    self.keychain = keychain

    //    let currentIdentifierForVendor = UIDevice.current.identifierForVendor?.uuidString
    //    if currentIdentifierForVendor != userDefaults.identifierForVendor() {
    //    if let currentIdentifierForVendor = currentIdentifierForVendor {
    //      storage.set(identifierForVendor: currentIdentifierForVendor)
    //    }
  }
}

extension KeychainSecretsService: SecretsService {
  internal func store(
    _ entry: SecretsServiceEntry,
    value: String
  ) async -> Result<Void, StoreError> {
    await Task {
      Result { try keychain.set(value, key: entry.key) }
        .mapError { StoreError.internalKeychainError(error: $0) }
    }.value
  }

  internal func retrieve(
    _ entry: SecretsServiceEntry
  ) async -> Result<String, RetrieveError> {
    await Task {
      Result { try keychain.getString(entry.key) }
        .mapError { RetrieveError.internalKeychainError(error: $0) }
        .replaceNil(with: .entryNotFoundInKeychain(entry: entry))
    }.value
  }
}

private extension SecretsServiceEntry {
  var key: String {
    switch self {
    case .privateAccessToken:
      return "private_access_token"
    }
  }
}

// TODO: make it generic and move to Casimir-Foundation
private extension Result where Success == String? {
  func replaceNil(
    with error: Failure
  ) -> Result<String, Failure> {
    self.flatMap { value -> Result<String, Failure> in
      guard let value else {
        return .failure(error)
      }
      return .success(value)
    }
  }
}
