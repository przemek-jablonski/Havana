import Octokit

public extension Octokit {
  /**
   Returns new instance of the `Octokit.Client` with configuration suitable for consuming `2022_11_28` API (latest).
   */
  static var instance: Octokit.Client {
    Octokit.Client_API_2022_11_28()
  }

  /**
   Returns singleton of the `Octokit.Client` with configuration suitable for consuming `2022_11_28` API (latest).
   */
  static var shared: Octokit.Client {
    Octokit.Client_API_2022_11_28.shared
  }
}
