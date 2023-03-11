/**
 Interface for generating haptic feedback on demand on the device.
 */
public struct Haptics {
  /**
   Actions that can be performed on given haptic feedback type.
   */
  enum Action {
    /**
     Preheats and prepares the Taptic Engine so that it's ready for producing haptic feedback in the future.
     After calling `prepare`, the Engine will be live for a few seconds.
     
     On Apple devices, Taptic Engine is a hardware part responsible for generating haptic feedback on demand.
     In order to preserve energy, the Taptic Engine is in the idle state all the time. In order to make it "live", there is a need to `prepare` it.
     "Unprepared" Taptic Engine can still trigger haptics, but this might be done with some delay, ruining the effect.
     */
    case prepare
    
    /**
     Requests the Taptic Engine to produce haptic feedback immediately.
     */
    case trigger
  }
  
  /**
   Light haptic feedback type to accompany operations such as user swipes.
   */
  var lightNudge: (Action) -> ()
  
  /**
   Light haptic feedback type for when user clicks a regular button.
   */
  var lightClick: (Action) -> ()
  
  /**
    Heavy haptic feedback type for when user clicks an important / prominent button.
   */
  var heavyClick: (Action) -> ()
}

// TODO: parallax
