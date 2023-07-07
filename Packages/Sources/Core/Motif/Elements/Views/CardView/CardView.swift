import Casimir
import SwiftUI

/**
 Container view that wraps over passed in`content` to provide a card-like background.
 */
public struct CardView<Content: View>: View {
  @ScaledMetric private var cardCornerRadius = 8.cgFloat
  @ScaledMetric private var cardBorderWidth = 1.cgFloat
  @ScaledMetric private var verticalPadding = 12.cgFloat
  @ScaledMetric private var horizontalPadding = 16.cgFloat

  private var content: () -> Content

  public init(
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.content = content
  }

  public var body: some View {
    content()
      .padding(.vertical, verticalPadding)
      .padding(.horizontal, horizontalPadding)
      .background(
        ZStack {
          fill(
            cornerRadius: cardCornerRadius
          )
          stroke(
            cornerRadius: cardCornerRadius - cardBorderWidth,
            lineWidth: cardBorderWidth
          )
        }
      )
  }
}

private extension View {
  @ViewBuilder
  func fill(
    cornerRadius: CGFloat
  ) -> some View {
    RoundedRectangle(
      cornerRadius: cornerRadius,
      style: .continuous
    )
    .fill(.thinMaterial)
  }

  @ViewBuilder
  func stroke(
    cornerRadius: CGFloat,
    lineWidth: CGFloat
  ) -> some View {
    RoundedRectangle(
      cornerRadius: cornerRadius,
      style: .continuous
    )
    .strokeBorder(
      .ultraThinMaterial,
      lineWidth: lineWidth
    )
  }
}

#if DEBUG
internal struct CardViewPreviews: PreviewProvider {
  internal static var previews: some View {
    List {
      ForEach(0..<20, id: \.self) { _ in
        CardView {
          content
        }
      }
    }
  }

  private static var content: some View {
    VStack {
      HStack {
        Image(systemName: "square.and.arrow.up")
        Text(String.random())
      }
      .maxWidth(.infinity, alignment: .leading)
      .font(.caption)

      Spacer()
      Text(String.random())
        .font(.headline)
        .maxWidth(.infinity, alignment: .leading)

      Text(String.random())
        .maxWidth(.infinity, alignment: .leading)
    }
  }
}
#endif
