import Foundation
import Octokit

// Note: protocol instead of `struct` to make working with generics (`ReturnType`) easier
internal protocol GithubNetworkClient {
  func request<ReturnType: Decodable>(
    resource: GithubResource
  ) async throws -> ReturnType
}
