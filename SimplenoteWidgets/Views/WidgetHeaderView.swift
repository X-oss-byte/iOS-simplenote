import SwiftUI
import WidgetKit


struct WidgetHeaderView: View {
    let text: String
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        HStack {
            Text(text)
                .font(.headline)
            if widgetFamily != .systemSmall {
                Spacer()
                NewNoteButton(size: Constants.side, foregroundColor: Constants.foregroundColor, backgroundColor: .white)
            }
        }
    }
}

struct NotePreviewHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetHeaderView(text: "Header")
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

private struct Constants {
    static let side = CGFloat(19)
    static let foregroundColor = Color(UIColor(studioColor: .spBlue50))
}