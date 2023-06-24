import Foundation

extension JSONDecoder {
  // swiftlint:disable identifier_name
  internal static var v4: JSONDecoder {
    JSONDecoder(
      dateDecodingStrategy: .iso8601
    )
  }
  // swiftlint:enable identifier_name
}
