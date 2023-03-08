import SwiftUI

public extension Grace.Button {
  struct Filled: View {
    public let image: Grace.SFSymbol
    public let title: String
    public let backgroundColor: Color // TODO: should be derived from some Grace config
    public let action: () -> Void
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
        .foregroundColor(Color(uiColor: UIColor.label))
        .buttonStyle(.borderless)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .cornerRadius(8, antialiased: true)
        .padding()
      }
    }
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
    }
}
