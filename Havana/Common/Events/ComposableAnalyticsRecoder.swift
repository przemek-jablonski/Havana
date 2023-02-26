import Foundation

// TODO: tests
// TODO: Casimir
struct ComposableEventsRecorder<Event> {
  static func instance() -> EventsRecorder<Event> {
    var destinations: [EventsRecorder<Event>.Destination<Event>] = []
    return EventsRecorder(
      addDestination: { destination in
        destinations.append(destination)
      },
      record: { event in
        destinations.forEach { $0.record(event) }
      }
    )
  }
}
