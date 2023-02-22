import Combine
import Foundation

internal struct GithubApiJsonDeserializer {
    private let jsonDecoder: JSONDecoder
    
    internal init() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        self.jsonDecoder = decoder
    }
}

extension GithubApiJsonDeserializer: Deserializer {
    func deserialize<Target: Decodable>(
        _ data: Data,
        into type: Target.Type
    ) -> AnyPublisher<Target, DeserializerError> {
        jsonDecoder.decode(to: type, from: data)
            .publisher
            .mapError { .internalDeserializationEngineError(targetType: type, error: $0) }
            .erased()
    }
}
