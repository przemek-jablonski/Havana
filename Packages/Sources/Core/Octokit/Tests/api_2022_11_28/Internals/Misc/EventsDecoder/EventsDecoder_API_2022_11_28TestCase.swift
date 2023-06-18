import Octokit
@testable import OctokitLive
import XCTest

internal final class EventsDecoder_API_2022_11_28TestCase: XCTestCase {
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

    try assertions?(decodingResult) ?? {
      XCTAssertNil(decodingResult.error, "Decoding produced failure result.")
    }()
  }
}
