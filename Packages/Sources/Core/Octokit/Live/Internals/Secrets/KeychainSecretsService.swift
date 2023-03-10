import Combine
import Foundation
import KeychainAccess

private let octokitKeychainEntry = "com.octokit.keychain"

internal struct KeychainSecretsService {
  private let keychain: Keychain
  private let dispatchQueue: DispatchQueue
  
  internal init(
    keychain: Keychain = Keychain(service: octokitKeychainEntry),
    dispatchQueue: DispatchQueue
  ) {
    self.keychain = keychain
    self.dispatchQueue = dispatchQueue
  }
}

extension KeychainSecretsService: SecretsService {
  func store(_ entry: SecretsServiceEntry, value: String) -> AnyPublisher<Void, StoreError> {
    keychain
      .set(entry, value: value)
      .subscribe(on: dispatchQueue)
      .mapError(StoreError.internalKeychainError(error: ))
      .eraseToAnyPublisher()
  }
  
  func retrieve(_ entry: SecretsServiceEntry) -> AnyPublisher<String, RetrieveError> {
    keychain
      .get(entry)
      .subscribe(on: dispatchQueue)
      .mapError(RetrieveError.internalKeychainError(error: ))
      .replaceNil(with: .entryNotFoundInKeychain(entry: entry))
      .eraseToAnyPublisher()
  }
}

private extension SecretsServiceEntry {
  var string: String {
    switch self {
      case .privateAccessToken:
        return "private_access_token"
    }
  }
}

private extension Keychain {
  func get(_ entry: SecretsServiceEntry) -> some Publisher<String?, Error> {
    Result { try self.getString(entry.string) }.publisher
  }
  
  func set(_ entry: SecretsServiceEntry, value: String) -> some Publisher<Void, Error> {
    Result { try self.set(value, key: entry.string) }.publisher
  }
}

private extension Publisher where Output == String? {
  func replaceNil<Error: Swift.Error>(with error: Error) -> some Publisher<String, Error> where Failure == Error {
    self.flatMap { string -> AnyPublisher<String, Error> in
      guard let string else {
        return Fail<String, Error>(error: error).eraseToAnyPublisher()
      }
      return Just(string).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
  }
}

