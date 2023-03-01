import Combine
import Casimir
import Octokit
import SwiftUI
import LoginFeature

struct ContentView: View {
  private let octokit = Octokit()
  private lazy var loginService: LoginService = {
    octokit.loginService
  }()
  private lazy var userService: UserService = {
    octokit.userService
  }()
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, World!")
    }
    .padding()
    .onAppear {
      loginService.login(using: "github_pat_***REMOVED***")
        .typeEraseError()
        .flatMap {
          userService.receivedEvents("przemek-jablonski", 1)
            .typeEraseError()
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

// TODO: to Casimir
private extension Publisher {
  func typeEraseError() -> some Publisher<Output, Error> {
    self.mapError { error in error as Error }
  }
}
