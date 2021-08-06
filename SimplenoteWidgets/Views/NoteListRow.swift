//
//  NoteListRow.swift
//  SimplenoteWidgetsExtension
//
//  Created by Charlie Scheer on 8/5/21.
//  Copyright © 2021 Automattic. All rights reserved.
//

import SwiftUI

struct NoteListRow: View {
    var noteTitle: String
    var width: CGFloat

    var body: some View {
        Text(noteTitle)
            .font(.body)
            .lineLimit(1)
            .frame(width: width - 20, height: 40.0, alignment: .leading)
        Divider()
    }
}

struct NoteListRow_Previews: PreviewProvider {
    static var previews: some View {
        NoteListRow(noteTitle: "Title for note", width: 100)
    }
}