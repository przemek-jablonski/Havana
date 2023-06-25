import Motif
import Octokit
import SwiftUI

internal enum EventView {}

extension EventView {
  internal struct Release: View {
    internal var event: Octokit.Event.ReleaseEvent
    internal var body: some View {
      EventCard(
        header: {
          EventHeader(
            Image(systemName: "shippingbox"),
            .purple,
            "NEW RELEASE"
          )
        },
        content: {
          Text("todo")
          //          Text(event.payload.release.assetsUrl)
        },
        footer: {
          HStack(alignment: .center) {
            Text(event.payload.action)
              .font(.caption)
          }
          .maxWidth(.infinity, alignment: .leading) // maybe this in line with header?
        }
      )
    }
  }
}

private struct EventHeader: View {
  internal let icon: Image
  internal let color: Color
  internal let name: String

  internal init(
    _ icon: Image,
    _ color: Color,
    _ name: String
  ) {
    self.icon = icon
    self.color = color
    self.name = name
  }

  internal var body: some View {
    HStack(alignment: .center) {
      icon
        .padding(4)
        .background(
          Circle()
            .fill(
              Color.purple.opacity(0.66)
            )
        )
      Text(name)
    }
    .maxWidth(.infinity, alignment: .leading)
    .font(.caption)
  }
}

private struct EventCard<Content: View, Footer: View>: View {
  private var header: () -> EventHeader
  private var content: () -> Content
  private var footer: () -> Footer

  internal init(
    @ViewBuilder header: @escaping () -> EventHeader,
    @ViewBuilder content: @escaping () -> Content,
    @ViewBuilder footer: @escaping () -> Footer
  ) {
    self.header = header
    self.content = content
    self.footer = footer
  }

  var body: some View {
    CardView {
      header()
      Divider()
      content()
      Divider()
      footer()
    }
  }
}

internal struct EventViewPreviews: PreviewProvider {
  internal static var previews: some View {
    NavigationView {
      List {
        ForEach(0..<20, id: \.self) { _ in
          Button(label: EventView.Release(event: .random())) {}
        }
        .listRowSeparator(.hidden)
      }
      .listStyle(.plain)
      .navigationTitle("Events")
    }
  }
}
