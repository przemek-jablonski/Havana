import Combine

public extension Octokit {
  struct FeedService {
    
    // MARK: - User Feed
    public var userFeed: () -> AnyPublisher<Void, UserFeedError>
    public enum UserFeedError: Error {
      
    }
  }
}
