import Combine
import Foundation
import Octokit

internal protocol NetworkClient {
  func request<ReturnType: Decodable>(
    _ type: ReturnType.Type,
    using data: Octokit.RequestCommonData
  ) async -> Result<ReturnType, NetworkClientError>
}
