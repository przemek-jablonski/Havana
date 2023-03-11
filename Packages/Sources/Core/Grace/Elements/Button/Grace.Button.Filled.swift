import SwiftUI

public extension Grace.Button {
  struct Filled: View {
    public init(
      image: Grace.SFSymbol,
      title: String,
      backgroundColor: Color,
      action: @escaping () -> Void
    ) {
      self.init(
        image: image,
        title: title,
        backgroundColor: backgroundColor,
        action: action,
        haptics: .shared
      )
    }
    
    internal init(
      image: Grace.SFSymbol,
      title: String,
      backgroundColor: Color,
      action: @escaping () -> Void,
      haptics: Haptics
    ) {
      self.image = image
      self.title = title
      self.backgroundColor = backgroundColor
      self.action = action
      self.haptics = haptics
    }
    
    public let image: Grace.SFSymbol
    public let title: String
    public let backgroundColor: Color // TODO: should be derived from some Grace config
    public let action: () -> Void
    private let haptics: Haptics
    
    public var body: some View {
      SwiftUI.Button(action: action) {
        HStack {
          Image(systemName: image)
          HStack {
            Text(title)
          }
          .lineLimit(1)
          .minimumScaleFactor(0.66)
          .frame(maxWidth: .infinity)
        }
      }
      .buttonStyle(FilledButtonStyle())
      .onAppear { haptics.lightClick(.prepare) }
      .onTapGesture { haptics.lightClick(.trigger) }
    }
  }
}

public struct FilledButtonStyle: ButtonStyle {
  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .foregroundColor(Color.label)
      .background(Color.accentColor.opacity(configuration.isPressed ? 0.66 : 1.00))
      .cornerRadius(8, antialiased: true)
      .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
      .shadow(
        color: Color.accentColor.opacity(configuration.isPressed ? 0.33 : 0.00),
        radius: configuration.isPressed ? 4 : 0,
        x: 0,
        y: 2
      )
      
  }
}

struct GraceButtonFilled_Previews: PreviewProvider {
  static var previews: some View {
    Grace.Button.Filled(
      image: "cube.transparent",
      title: "asdasdasd",
      backgroundColor: .red,
      action: {}
    )
    .previewLayout(.sizeThatFits)
    .padding()
  }
}
