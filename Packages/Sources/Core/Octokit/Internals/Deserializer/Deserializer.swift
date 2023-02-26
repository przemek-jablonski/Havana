import Combine
import Foundation

internal protocol Deserializer {
  /**
   - Note: Has to return type erased Publisher (`AnyPublisher`), because of generic type used in function declaration.
   */
  func deserialize<Target: Decodable>(
    _ data: Data,
    into type: Target.Type
  ) -> AnyPublisher<Target, DeserializerError>
}
