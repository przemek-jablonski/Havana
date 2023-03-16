import Combine
import Foundation

internal struct GithubApiJsonDeserializer {
  private let jsonDecoder: JSONDecoder
  
  internal init(
    jsonDecoder: JSONDecoder = JSONDecoder(dateDecodingStrategy: .iso8601)
  ) {
    self.jsonDecoder = jsonDecoder
  }
}

extension GithubApiJsonDeserializer: Deserializer {
  func deserialize<Target: Decodable>(
    _ data: Data,
    into type: Target.Type
  ) -> AnyPublisher<Target, DeserializerError> {
    jsonDecoder.decode(to: type, from: data)
      .publisher
      .mapError { DeserializerError.internalDeserializationEngineError(targetType: type, error: $0) }
      .eraseToAnyPublisher()
  }
}

private extension JSONDecoder {
  convenience init(dateDecodingStrategy: DateDecodingStrategy) {
    self.init()
    self.dateDecodingStrategy = dateDecodingStrategy
  }
}

private extension JSONDecoder {
  func decode<Target: Decodable>(to type: Target.Type, from data: Data) -> Result<Target, Error> {
    do {
      return .success(try decode(type, from: data))
    } catch {
      return .failure(error)
    }
  }
}
