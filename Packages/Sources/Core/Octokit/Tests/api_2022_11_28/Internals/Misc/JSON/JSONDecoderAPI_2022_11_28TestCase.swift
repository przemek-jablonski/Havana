import Casimir
import Octokit
@testable import OctokitLive
import XCTest

internal final class JSONDecoder_API_2022_11_28TestCase: XCTestCase {
  internal func test_decodingJsonWithInvalidSchema_producesFailureResult() throws {
    try performDecoding(
      of: [Octokit.UserBrief].self,
      from: "users_01_corrupted.json",
      assert: { decodedResult in
        guard case Result.failure(let error) = decodedResult else {
          return XCTFail("Decoding operation was expected to fail, but produced `success`.")
        }
        XCTAssertTrue(error is DecodingError)
      }
    )
  }

  internal func test_decodingListOfShortenedUserData_succeedsAndProducesCorrectAmountOfUserBriefs() throws {
    try performDecoding(
      of: [Octokit.UserBrief].self,
      from: "users_01.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decodingExampleSingleUserFile02_succeedsAndReturnsFullSingleUserData() throws {
    try performDecoding(
      of: Octokit.User.self,
      from: "users_02.json"
    )
  }

  internal func test_decodingExampleSingleUserFile03_succeedsAndReturnsFullSingleUserData() throws {
    try performDecoding(
      of: Octokit.User.self,
      from: "users_03.json"
    )
  }

  internal func test_decodingExampleSingleUserFile04_succeedsAndReturnsFullSingleUserData() throws {
    try performDecoding(
      of: Octokit.User.self,
      from: "users_04.json"
    )
  }

  internal func test_decodingExampleSingleUserFile05_succeedsAndReturnsFullSingleUserData() throws {
    try performDecoding(
      of: Octokit.User.self,
      from: "users_05.json"
    )
  }

  internal func test_decoding_repository_01_producesValueSuccessfully() throws {
    try performDecoding(
      of: Octokit.Repository.self,
      from: "repository_01.json"
    )
  }

  internal func test_decoding_repository_02_producesValueSuccessfully() throws {
    try performDecoding(
      of: Octokit.Repository.self,
      from: "repository_02.json"
    )
  }

  internal func test_decoding_repository_03_producesValueSuccessfully() throws {
    try performDecoding(
      of: Octokit.Repository.self,
      from: "repository_03.json"
    )
  }

  internal func test_decoding_repository_04_producesValueSuccessfully() throws {
    try performDecoding(
      of: Octokit.Repository.self,
      from: "repository_04.json"
    )
  }

  internal func test_decoding_repository_05_producesValueSuccessfully() throws {
    try performDecoding(
      of: Octokit.Repository.self,
      from: "repository_05.json"
    )
  }

  internal func test_decoding_repository_06_producesValueSuccessfully() throws {
    try performDecoding(
      of: Octokit.Repository.self,
      from: "repository_06.json"
    )
  }

  internal func test_decoding_releases_01_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Release].self,
      from: "releases_01.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_releases_02_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Release].self,
      from: "releases_02.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_releases_03_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Release].self,
      from: "releases_03.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_releases_04_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Release].self,
      from: "releases_04.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 20)
      }
    )
  }

  internal func test_decoding_pull_requests_01_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.PullRequest].self,
      from: "pull_requests_01.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_pull_requests_02_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.PullRequest].self,
      from: "pull_requests_02.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 5)
      }
    )
  }

  internal func test_decoding_pull_requests_03_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.PullRequest].self,
      from: "pull_requests_03.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_pull_requests_04_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.PullRequest].self,
      from: "pull_requests_04.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issues_01_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Issue].self,
      from: "issues_01.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issues_02_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Issue].self,
      from: "issues_02.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issues_03_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Issue].self,
      from: "issues_03.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issues_04_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Issue].self,
      from: "issues_04.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issues_05_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Issue].self,
      from: "issues_05.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issues_06_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.Issue].self,
      from: "issues_06.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issue_comments_01_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.IssueComment].self,
      from: "issue_comments_01.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issue_comments_02_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.IssueComment].self,
      from: "issue_comments_02.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issue_comments_03_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.IssueComment].self,
      from: "issue_comments_03.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decoding_issue_comments_04_producesValueSuccessfully() throws {
    try performDecoding(
      of: [Octokit.IssueComment].self,
      from: "issue_comments_04.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }
}

private extension XCTestCase {
  func performDecoding<T: Codable>(
    of type: T.Type,
    from fileName: String,
    assert assertions: ((Result<T, any Error>) throws -> ())? = nil
  ) throws {
    let jsonPath = try XCTUnwrap(Bundle.module.path(of: fileName))
    let jsonUrl = try XCTUnwrap(URL(fileURLWithPath: jsonPath))
    let jsonData = try Data(contentsOf: jsonUrl)

    let decodingResult = JSONDecoder.forAPI_2022_11_28
      .decode(
        type,
        using: jsonData
      )

    try assertions?(decodingResult) ?? {
      XCTAssertNil(decodingResult.error, "Decoding produced failure result.")
    }()
  }
}
