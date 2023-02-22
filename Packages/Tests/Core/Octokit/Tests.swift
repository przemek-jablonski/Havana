import Combine
@testable import Octokit
import XCTest

final class Tests: XCTestCase {
  
  func testCall() throws {
    let expc = expectation(description: "")
    var cancellables = Set<AnyCancellable>()
    NetworkClient.urlSession().get(
      "https://api.github.com/users/przemek-jablonski/received_events/public",
      nil,
      [
        "Accept": "application/vnd.github+json",
        "Authorization": "Bearer <YOUR-TOKEN>",
        "X-GitHub-Api-Version": "2022-11-28"
      ],
      [:]
    ).sinkValue { output in
      let ou = output
      expc.fulfill()
    }.store(in: &cancellables)
    
    waitForExpectations(timeout: 5, handler: nil)
  }
}
