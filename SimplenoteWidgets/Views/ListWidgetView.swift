import SwiftUI
import WidgetKit

struct ListWidgetView: View {
    var entry: ListWidgetEntry
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        let numberOfRows = rows(for: widgetFamily)

        GeometryReader { geometry in
            ZStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: .zero) {
                        ListWidgetHeaderView(tag: entry.widgetTag)
                            .padding(.trailing, Constants.sidePadding)
                            .padding([.bottom, .top], Constants.topAndBottomPadding)
                        NoteListTable(entry: entry,
                                      numberOfRows: numberOfRows,
                                      geometry: geometry)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.leading, Constants.sidePadding)
                }
            }
            .filling()
            .background(Color.widgetBackgroundColor)
        }
    }

    func rows(for widgetFamily: WidgetFamily) -> Int {
        switch widgetFamily {
        case .systemLarge:
            return Constants.largeRows
        default:
            return Constants.mediumRows
        }
    }
}

private struct Constants {
    static let mediumRows = 3
    static let largeRows = 8
    static let sidePadding = CGFloat(20)
    static let topAndBottomPadding = CGFloat(10)
}

struct ListWidgetView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            ListWidgetView(entry: ListWidgetEntry(date: Date(), widgetTag: WidgetTag(kind: .allNotes), noteProxys: DemoContent.listProxies))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            ListWidgetView(entry: ListWidgetEntry(date: Date(), widgetTag: WidgetTag(kind: .allNotes), noteProxys: DemoContent.listProxies))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .colorScheme(.dark)
        }
    }
}