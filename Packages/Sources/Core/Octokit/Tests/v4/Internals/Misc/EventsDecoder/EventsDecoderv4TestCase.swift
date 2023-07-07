import Octokit
@testable import OctokitLive
import XCTest

internal final class EventsDecoder_API_2022_11_28TestCase: XCTestCase {
  internal func test_decodingExampleEventsFile1_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_1.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 30)
      }
    )
  }

  internal func test_decodingExampleEventsFile2_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_2.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 30)
      }
    )
  }

  internal func test_decodingExampleEventsFile3_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_3.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 30)
      }
    )
  }

  internal func test_decodingExampleEventsFile4_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_4.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 29)
      }
    )
  }

  internal func test_decodingExampleEventsFile5_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_5.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 30)
      }
    )
  }

  internal func test_decodingExampleEventsFile6_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_6.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile7_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_7.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile8_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_8.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 96)
      }
    )
  }

  internal func test_decodingExampleEventsFile9_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_9.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile10_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_10.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 10)
      }
    )
  }

  internal func test_decodingExampleEventsFile11_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_11.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile12_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_12.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile13_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_13.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 97)
      }
    )
  }

  internal func test_decodingExampleEventsFile14_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_14.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 79)
      }
    )
  }

  internal func test_decodingExampleEventsFile15_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_15.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 52)
      }
    )
  }

  internal func test_decodingExampleEventsFile16_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_16.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile17_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_17.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 62)
      }
    )
  }

  internal func test_decodingExampleEventsFile18_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_18.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 95)
      }
    )
  }
  internal func test_decodingExampleEventsFile19_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_19.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile20_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_20.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile21_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_21.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 100)
      }
    )
  }

  internal func test_decodingExampleEventsFile22_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_22.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 63)
      }
    )
  }

  internal func test_decodingExampleEventsFile23_succeedsAndProducesCorrectAmountOfEvents() async throws {
    try await performDecodingOfEvents(
      from: "events_23.json",
      assert: { decoded in
        XCTAssertEqual(decoded.count, 24)
      }
    )
  }
}

private extension XCTestCase {
  func performDecodingOfEvents(
    from fileName: String,
    assert assertions: (([Octokit.Event]) throws -> ())? = nil
  ) async throws {
    let jsonPath = try XCTUnwrap(Bundle.module.path(of: fileName))
    let jsonUrl = try XCTUnwrap(URL(fileURLWithPath: jsonPath))
    let jsonData = try Data(contentsOf: jsonUrl)

    let decoded = try await EventsDecoder.v4(jsonDecoder: .v4).decodeEvents(jsonData)

    try assertions?(decoded)
  }
}
