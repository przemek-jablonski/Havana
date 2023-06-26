import Casimir

public extension Octokit.Event {
  struct Repository: ModelProtocol {
    public let id: Int
    public let name: String
    public let url: String

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case name = "name"
      case url = "url"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        name: .random(),
        url: .random()
      )
    }
  }
}
