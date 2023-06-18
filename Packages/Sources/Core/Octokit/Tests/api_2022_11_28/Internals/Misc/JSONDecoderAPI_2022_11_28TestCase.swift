import Octokit
@testable import OctokitLive
import XCTest

internal final class JSONDecoderAPI_2022_11_28DecodingTestCase: XCTestCase {

  // MARK: - Octokit.Event.self

  internal func test_decodingExampleEventsFile1_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_1.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decodingExampleEventsFile2_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_2.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decodingExampleEventsFile3_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_3.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decodingExampleEventsFile4_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_4.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 29)
      }
    )
  }

  internal func test_decodingExampleEventsFile5_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_5.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 30)
      }
    )
  }

  internal func test_decodingExampleEventsFile6_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_6.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile7_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_7.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile8_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_8.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 96)
      }
    )
  }

  internal func test_decodingExampleEventsFile9_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_9.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile10_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_10.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 10)
      }
    )
  }

  internal func test_decodingExampleEventsFile11_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_11.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile12_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_12.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile13_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_13.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 97)
      }
    )
  }

  internal func test_decodingExampleEventsFile14_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_14.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 79)
      }
    )
  }

  internal func test_decodingExampleEventsFile15_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_15.json",
      assert: { decodedResult in
        XCTAssertEqual(try decodedResult.get().count, 52)
      }
    )
  }

  //  internal func test_decodingExampleEventsFile_doesntThrow_1() async throws {
  //    try await performDecoding(of: "events_1.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_2() async throws {
  //    try await performDecoding(of: "events_2.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_3() async throws {
  //    try await performDecoding(of: "events_3.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_4() async throws {
  //    try await performDecoding(of: "events_4.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_5() async throws {
  //    try await performDecoding(of: "events_5.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_6() async throws {
  //    try await performDecoding(of: "events_6.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_7() async throws {
  //    try await performDecoding(of: "events_7.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_8() async throws {
  //    try await performDecoding(of: "events_8.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_9() async throws {
  //    try await performDecoding(of: "events_9.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_10() async throws {
  //    try await performDecoding(of: "events_10.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_11() async throws {
  //    try await performDecoding(of: "events_11.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_12() async throws {
  //    try await performDecoding(of: "events_12.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_13() async throws {
  //    try await performDecoding(of: "events_13.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_14() async throws {
  //    try await performDecoding(of: "events_14.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }
  //
  //  internal func test_decodingExampleEventsFile_doesntThrow_15() async throws {
  //    try await performDecoding(of: "events_15.json", to: Octokit.Event.self, using: JSONDecoder.forAPI_2022_11_28)
  //  }

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
  func performDecodingOfEvents(
    from fileName: String,
    assert assertions: ((Result<[Octokit.Event], EventsDecoderError>) throws -> ())? = nil
  ) async throws {
    let jsonPath = try XCTUnwrap(Bundle.module.path(of: fileName))
    let jsonUrl = try XCTUnwrap(URL(fileURLWithPath: jsonPath))
    let jsonData = try Data(contentsOf: jsonUrl)

    let decodingResult = await EventsDecoder_API_2022_11_28(
      jsonDecoder: .forAPI_2022_11_28
    )
      .decodeEvents(from: jsonData)

    try assertions?(decodingResult)
  }
}
