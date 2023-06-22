import Foundation

extension JSONDecoder {
  internal static var v4: JSONDecoder {
    JSONDecoder(
      dateDecodingStrategy: .iso8601
    )
  }
}
