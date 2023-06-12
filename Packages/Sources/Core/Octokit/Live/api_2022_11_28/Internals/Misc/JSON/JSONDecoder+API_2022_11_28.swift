import Casimir
import Foundation

internal extension JSONDecoder {
  internal static var forAPI_2022_11_28: JSONDecoder {
    JSONDecoder(
      dateDecodingStrategy: .iso8601
    )
  }
}
