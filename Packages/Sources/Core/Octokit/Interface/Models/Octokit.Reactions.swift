import Casimir
import Foundation

public extension Octokit {
  // MARK: - Reactions
  struct Reactions: ModelProtocol {
    public var id: String { url }
    public let plus1: Int
    public let minus1: Int
    public let confused: Int
    public let eyes: Int
    public let heart: Int
    public let hooray: Int
    public let laugh: Int
    public let rocket: Int
    public let totalCount: Int?
    public let url: String

    enum CodingKeys: String, CodingKey {
      case plus1 = "+1"
      case minus1 = "-1"
      case confused = "confused"
      case eyes = "eyes"
      case heart = "heart"
      case hooray = "hooray"
      case laugh = "laugh"
      case rocket = "rocket"
      case totalCount = "total_count"
      case url = "url"
    }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        plus1: .random(),
        minus1: .random(),
        confused: .random(),
        eyes: .random(),
        heart: .random(),
        hooray: .random(),
        laugh: .random(),
        rocket: .random(),
        totalCount: .random(),
        url: .random()
      )
    }
  }
}
