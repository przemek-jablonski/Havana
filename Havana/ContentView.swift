import Combine
import Casimir
import Octokit
import SwiftUI
import LoginFeature

class ContentViewModel: ObservableObject {
//  private let loginService: LoginService
//  private let userService: UserService
  private var cancellables = Set<AnyCancellable>()
  init() {
//    self.loginService = Octokit.shared.loginService
//    self.userService = Octokit.shared.userService
    
//    loginService
//      .login(using: "...")
//      .eraseErrorType()
//      .flatMap { [userService] in
//        userService.receivedEvents("przemek-jablonski", 1)
//          .eraseErrorType()
//      }
//      .on(event: { event in
//        let ev = event
//        let asd = 2
//      })
//      .sink()
//      .store(in: &cancellables)
  }
}

struct ContentView: View {
  
  @StateObject var viewModel = ContentViewModel()
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, World!")
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
