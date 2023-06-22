import ComposableArchitecture
import Foundation

internal extension TaskResult where Success == None {
  /**
   Creates a new task result by evaluating an async throwing closure, casting the returned value to `.success(.none)`,
   or any thrown error as a `.failure(error)`.

   - Parameter body: An async, throwing closure.
   */
  init(
    catching body: @Sendable () async throws -> Void
  ) async {
    do {
      _ = try await body()
      self = .success(.none)
    } catch {
      self = .failure(error)
    }
  }

  /**
   Transforms a `Result` into a `TaskResult`, erasing its `Failure` to `Error` and `Void` to `None`.
   - Parameter result: A result.
   */
  init<Failure>(
    _ result: Result<Void, Failure>
  ) {
    switch result {
    case .success:
      self = .success(.none)
    case .failure(let error):
      self = .failure(error)
    }
  }
}

/**
 Represents no data in type-nominal way.
 - Note: Useful for pointfree's `TaskResult` API to emulate `TaskResult<Void>` case (operation which doesn't produce any data if succeeds).
 - Note: Note that `TaskResult<Void>` itself is non-Equatable, meanwhile `TaskResult<None>` actually is.
 */
public enum None: Equatable, Sendable {
  // swiftlint:disable discouraged_none_name
  case none
  // swiftlint:enable discouraged_none_name
}
