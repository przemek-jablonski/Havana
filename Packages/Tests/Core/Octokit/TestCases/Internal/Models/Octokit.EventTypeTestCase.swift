// import Octokit
// import OctokitLive
// import XCTest
//
// internal final class OctokitEventTypeDecodingTestCase: XCTestCase {
//  internal func test_decodingEventTypeUsingGollumString_producesGollumEvent() throws {
//    try performDecoding(
//      of: """
//          "GollumEvent"
//          """,
//      assertions: { result in
//        XCTAssertEqual(result, Octokit.EventType.gollum)
//      }
//    )
//  }
//
//  internal func test_decodingEventTypeUsingPublicString_producesPublicEvent() throws {
//    try performDecoding(
//      of: """
//          "PublicEvent"
//          """,
//      assertions: { result in
//        XCTAssertEqual(result, Octokit.EventType.public)
//      }
//    )
//  }
//
//  internal func test_decodingEventTypeUsingUnknownString_producesUnknownEventWithUnknownStringAsPayload() throws {
//    try performDecoding(
//      of: """
//          "Unknown"
//          """,
//      assertions: { result in
//        XCTAssertEqual(result, Octokit.EventType.unknown("Unknown"))
//      }
//    )
//  }
//
//  internal func test_decodingEventTypeUsingEmptyString_producesUnknownEventWithEmptyStringAsPayload() throws {
//    try performDecoding(
//      of: """
//          ""
//          """,
//      assertions: { result in
//        XCTAssertEqual(result, Octokit.EventType.unknown(""))
//      }
//    )
//  }
//
//  internal func test_decodingEventTypeUsingRandomString_producesUnknownEventWithRandomStringAsPayload() throws {
//    let string = String.random
//    try performDecoding(
//      of: """
//          "\(string)"
//          """,
//      assertions: { result in
//        XCTAssertEqual(result, Octokit.EventType.unknown(string))
//      }
//    )
//  }
//
//  internal func test_decodingEventTypeUsingRandomInt_producesUnknownEventWithEmptyStringAsPayload() throws {
//    let int = Int.random
//    try performDecoding(
//      of: """
//          \(int)
//          """,
//      assertions: { result in
//        XCTAssertEqual(result, Octokit.EventType.unknown(""))
//      }
//    )
//  }
// }
//
// private extension XCTestCase {
//  func performDecoding(
//    of json: String,
//    assertions: (_ result: Octokit.EventType) -> ()
//  ) throws {
//    let data = try XCTUnwrap(
//      json.data(
//        using: .utf8
//      )
//    )
//
//    let eventType: Octokit.EventType = try JSONDecoder().decode(
//      Octokit.EventType.self,
//      from: data
//    )
//
//    assertions(eventType)
//  }
// }
