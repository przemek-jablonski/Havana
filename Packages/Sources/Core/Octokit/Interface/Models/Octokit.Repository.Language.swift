import Casimir
import Foundation

public extension Octokit.Repository {
  /**
   Represents the single language used in the Repository.
   */
  struct Language: ModelProtocol {
    public var id: String { name }

    /**
     Name of the language used (eg. `swift`, `python` etc).
     */
    let name: String

    /**
     Amount of bytes that are in repository written in given language.
     */
    let bytes: Int

    public init(name: String, bytes: Int) {
      self.name = name
      self.bytes = bytes
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        name: .random(),
        bytes: .random()
      )
    }
  }
}
