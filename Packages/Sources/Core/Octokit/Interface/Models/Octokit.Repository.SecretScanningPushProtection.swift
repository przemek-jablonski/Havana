import Casimir
import Foundation

public extension Octokit.Repository {
  struct SecretScanningPushProtection: ModelProtocol {
    public let status: Status?
    public let id = UUID()

    internal enum CodingKeys: String, CodingKey {
      case status = "status"
    }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        status: .random()
      )
    }
  }
}
