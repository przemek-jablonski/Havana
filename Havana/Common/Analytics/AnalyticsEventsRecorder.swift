import Foundation

public struct AnalyticsEventsRecorder<Event> {
  struct Destination<Event> {
    var record: (Event) -> ()
  }
  
  var addDestination: (Destination<Event>) -> ()
  var record: (Event) -> ()
}

//AnalyticsEventsRecorder
extension AnalyticsEventsRecorder {
  static let  =
}
