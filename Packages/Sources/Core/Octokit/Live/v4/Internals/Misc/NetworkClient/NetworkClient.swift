import Foundation
import Octokit

internal protocol NetworkClient {
  func request(
    using data: Octokit.RequestCommonData
  ) async -> Result<Data, NetworkClientError>

  func request<ReturnType: Decodable>(
    _ type: ReturnType.Type,
    using data: Octokit.RequestCommonData
  ) async -> Result<ReturnType, NetworkClientError>
}
