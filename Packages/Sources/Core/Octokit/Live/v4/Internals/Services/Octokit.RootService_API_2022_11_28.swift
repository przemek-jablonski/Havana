import Foundation
import Octokit

extension Octokit {
  internal struct RootService_API_2022_11_28 {
    private let config: Octokit.Config
    private let networkClient: NetworkClient

    internal init(
      config: Octokit.Config,
      networkClient: NetworkClient
    ) {
      self.config = config
      self.networkClient = networkClient
    }
  }
}

extension Octokit.RootService_API_2022_11_28: Octokit.RootService {
  internal func get(
    privateAccessToken: String?
  ) async -> Result<Octokit.Hyperlinks, Octokit.NetworkServiceError> {
    await networkClient
      .request(
        Octokit.Hyperlinks.self,
        using: .root(
          config: config,
          privateAccessToken: privateAccessToken
        )
      )
      .mapError(Octokit.NetworkServiceError.networkRequestFailed)
  }

  internal func validate(
    privateAccessToken: String
  ) async -> Result<Void, Octokit.PrivateAccessTokenValidationError> {
    await get(privateAccessToken: privateAccessToken)
      .map { _ in () }
      .mapError(Octokit.PrivateAccessTokenValidationError.remoteDeclaredPrivateAccessTokenInvalid)

  }
}

private extension Octokit.RequestCommonData {
  static func root(
    config: Octokit.Config,
    privateAccessToken: String?
  ) -> Octokit.RequestCommonData {
    config.constructCommonRequestData(
      endpointUrl: "/",
      method: .get,
      token: privateAccessToken
    )
  }
}
