import Casimir
import Foundation

public extension Octokit.Issue {
  enum Label: ModelProtocol {
    case label(Specific)
    case string(String)

    public init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      if let string = try? container.decode(String.self) {
        self = .string(string)
        return
      }
      if let specific = try? container.decode(Specific.self) {
        self = .label(specific)
        return
      }
      throw DecodingError.typeMismatch(Label.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Label"))
    }

    public func encode(to encoder: Encoder) throws {
      var container = encoder.singleValueContainer()
      switch self {
        case .label(let label):
          try container.encode(label)
        case .string(let string):
          try container.encode(string)
      }
    }

    public var id: UUID { UUID() }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      [
        .label(.random()),
        .string(.random())
      ]
        .random()
    }
  }
}
