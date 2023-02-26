import Casimir
import Combine
@testable import Octokit
import XCTest

final class Tests: XCTestCase {
  
  func testCall() throws {
    let expc = expectation(description: "")
    var cancellables = Set<AnyCancellable>()
    URLSessionNetworkClient(urlSessionInstance: .shared)
      .request(
        url: "https://api.github.com/users/przemek-jablonski/received_events/public",
        method: .get,
        body: nil,
        headers: [
          "Accept": "application/vnd.github+json",
          "Authorization": "Bearer <YOUR-TOKEN>",
          "X-GitHub-Api-Version": "2022-11-28"
        ],
        queryItems: nil
      )
      .mapError { error in error as Error }
      .flatMap { data in
        GithubApiJsonDeserializer()
          .deserialize(data, into: [ReceivedEvent].self)
          .mapError { error in error as Error }
        //                    .mapError { _ in .serverReturnedNonHTTPContent } // TODO
          .map { ($0, data) }
      }
      .on(event: { event in
        let ev = event
        let asd = 2
      })
      .sink()
    //            .sinkValue { output in
    //                let ou = output
    //                expc.fulfill()
    //            }
      .store(in: &cancellables)
    
    waitForExpectations(timeout: 5, handler: nil)
  }
}
