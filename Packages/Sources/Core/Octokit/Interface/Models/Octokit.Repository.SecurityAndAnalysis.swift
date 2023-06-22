import Casimir
import Foundation

public extension Octokit.Repository {
  struct SecurityAndAnalysis: ModelProtocol {
    public let advancedSecurity: AdvancedSecurity?
    public let secretScanning: SecretScanning?
    public let secretScanningPushProtection: SecretScanningPushProtection?
    public let id = UUID()

    internal enum CodingKeys: String, CodingKey {
      case advancedSecurity = "advanced_security"
      case secretScanning = "secret_scanning"
      case secretScanningPushProtection = "secret_scanning_push_protection"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        advancedSecurity: .random(),
        secretScanning: .random(),
        secretScanningPushProtection: .random()
      )
    }
  }
}
