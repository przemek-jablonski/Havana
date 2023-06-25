import Casimir
import SwiftUI

private let cardCornerRadius = 8.cgFloat
private let cardBorderWidth = 1.cgFloat

/**
 Container view that wraps over passed in`content` to provide a card-like background.
 */
public struct CardView<Content: View>: View {
  private var content: () -> Content

  public init(
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.content = content
  }

  public var body: some View {
    content()
      .padding()
      .background(
        ZStack {
          RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous)
            .fill(.regularMaterial)
          RoundedRectangle(cornerRadius: cardCornerRadius - cardBorderWidth, style: .continuous)
            .strokeBorder(.ultraThinMaterial, lineWidth: cardBorderWidth)
        }
      )
  }
}

internal struct CardViewPreviews: PreviewProvider {
  internal static var previews: some View {
    List {
      CardView {
        VStack {
          HStack {
            Image(systemName: "square.and.arrow.up")
            Text(String.random())
          }
          Text(String.random())
        }
      }
    }
  }
}
