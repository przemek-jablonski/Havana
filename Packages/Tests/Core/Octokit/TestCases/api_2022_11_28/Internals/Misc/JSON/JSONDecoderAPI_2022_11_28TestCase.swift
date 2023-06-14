import Octokit
@testable import OctokitLive
import XCTest

internal final class JSONDecoderAPI_2022_11_28DecodingTestCase: XCTestCase {

  // MARK: - Octokit.Event.self

  internal func test_decodingExampleEventsFile_doesntThrow_1() async throws {
    try await performDecoding(of: "events_1.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
//    await try performDecoding(of: "events_1.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
    // TODO: test amount of items
  }

  internal func test_decodingExampleEventsFile_doesntThrow_2() async throws {
    try await performDecoding(of: "events_2.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_3() async throws {
    try await performDecoding(of: "events_3.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_4() async throws {
    try await performDecoding(of: "events_4.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_5() async throws {
    try await performDecoding(of: "events_5.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_6() async throws {
    try await performDecoding(of: "events_6.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_7() async throws {
    try await performDecoding(of: "events_7.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_8() async throws {
    try await performDecoding(of: "events_8.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_9() async throws {
    try await performDecoding(of: "events_9.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_10() async throws {
    try await performDecoding(of: "events_10.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_11() async throws {
    try await performDecoding(of: "events_11.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_12() async throws {
    try await performDecoding(of: "events_12.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_13() async throws {
    try await performDecoding(of: "events_13.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_14() async throws {
    try await performDecoding(of: "events_14.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  internal func test_decodingExampleEventsFile_doesntThrow_15() async throws {
    try await performDecoding(of: "events_15.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  }

  // MARK: - Octokit.Event.self

  //  internal func test_decodingExampleEventsFile_doesntThrow_01() throws {
  //    try performDecoding(of: "users_01.json", to: Octokit.User.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_02() throws {
  //    try performDecoding(of: "users_02.json", to: Octokit.User.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_03() throws {
  //    try performDecoding(of: "users_03.json", to: Octokit.User.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_04() throws {
  //    try performDecoding(of: "users_04.json", to: Octokit.User.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_05() throws {
  //    try performDecoding(of: "users_05.json", to: Octokit.User.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
}

private extension XCTestCase {
  func performDecoding<TargetType: Decodable>(
    of fileNameWithExtension: String,
    to targetType: TargetType.Type,
    using jsonDecoder: JSONDecoder
  ) async throws {
    let jsonPath = try XCTUnwrap(Bundle.module.path(of: fileNameWithExtension))
    let jsonUrl = try XCTUnwrap(URL(fileURLWithPath: jsonPath))
    let jsonData = try Data(contentsOf: jsonUrl)

    let result = await EventsDecoder_API_2022_11_28(
      jsonDecoder: .forAPI_2022_11_28
    )
    .decodeEvents(from: jsonData)

    let asd = 2

//    _ = try jsonDecoder.decode([TargetType].self, from: jsonData).get()
  }
}
