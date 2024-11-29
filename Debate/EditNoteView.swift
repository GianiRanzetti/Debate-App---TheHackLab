//
//  EditNoteView.swift
//  Debate
//
//  Created by Chase Ünal on 26.11.2024.
//

import SwiftUI
import SwiftData

struct EditNoteView: View {
    
    @Bindable var note: Notes
    
    var body: some View {
        TextField("Name" , text: $note.name)
            .font(.system(size: 25))
            .bold()
        TextEditor(text: $note.full)
    }
}
