import Foundation
import KeychainAccess

private let octokitKeychainEntry = "com.octokit.keychain"

internal extension SecretsService {
  static func keychain(
    keychain: Keychain = Keychain(service: octokitKeychainEntry)
  ) -> Self {
    Self(
      store: { entry, value in
        try keychain.set(value, key: String(describing: entry))
      },
      retrieve: { entry in
        enum RetrieveError: Error {
          case noValueForEntry(_ entry: Entry)
        }
        return try keychain.getString(String(describing: entry)) ?? { throw RetrieveError.noValueForEntry(entry) }()
      }
    )
  }
}

// TODO: tests if String(describing: entry) always produces the same value
