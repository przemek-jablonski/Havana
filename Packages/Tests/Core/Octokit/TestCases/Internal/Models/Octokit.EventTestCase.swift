import Octokit
@testable import OctokitLive
import XCTest

internal final class OctokitEventDecodingTestCase: XCTestCase {
  func test_decodingExampleEventsFile_doesntThrow_1() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_1.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_2() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_2.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_3() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_3.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_4() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_4.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_5() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_5.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_6() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_6.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_7() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_7.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_8() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_8.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_9() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_9.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_10() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_10.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_11() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_11.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_12() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_12.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_13() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_13.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_14() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_14.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }

  func test_decodingExampleEventsFile_doesntThrow_15() throws {
    XCTAssertNoThrow(
      try performDecoding(
        of: "events_15.json",
        using: JSONDecoder.forAPI_2022_11_28,
        assertions: { _, _ in }
      )
    )
  }
}

private extension XCTestCase {
  func performDecoding(
    of fileNameWithExtension: String,
    using jsonDecoder: JSONDecoder,
    assertions: (_ fileNameWithExtension: String, _ result: [Octokit.Event]) -> ()
  ) throws {
    let jsonPath = try XCTUnwrap(Bundle.module.path(of: fileNameWithExtension))
    let jsonUrl = try XCTUnwrap(URL(fileURLWithPath: jsonPath))
    let jsonData = try Data(contentsOf: jsonUrl)

    let result: [Octokit.Event] = try jsonDecoder.decode([Octokit.Event].self, from: jsonData)

    assertions(
      fileNameWithExtension,
      result
    )
  }
}
