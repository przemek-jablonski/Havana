import Foundation

public struct EventsRecorder<Event> {
  public struct Destination<Event> {
    public var record: (Event) -> ()
  }

  public var addDestination: (Destination<Event>) -> ()
  public var record: (Event) -> ()
}
