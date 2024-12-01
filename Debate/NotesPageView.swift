//
//  NotesPageView.swift
//  Debate
//
//  Created by Chase Ünal on 1.12.2024.
//

import Foundation

import SwiftUI
import SwiftData

struct NotesPageView: View {
    
    @Bindable var viewName: ViewName
    
    @Environment(\.modelContext) private var context
    
    @Query private var notes: [Notes]
    
    @State private var path = [Notes]()
    
    var body: some View {
            NavigationStack (path: $path) {
                List {
                    ForEach(notes) { note in NavigationLink(value: note) {
                        VStack(alignment: .leading) {
                            Text(note.name)
                                .font(.headline)
                        }
                    }
                    }
                    .onDelete {
                        indexes in  for index in indexes {
                            deleteNote(notes[index])
                        }
                    }
                }
                .navigationDestination(for: Notes.self, destination: EditNoteView.init)
                .toolbar {
                    Button {
                        viewName.name = viewName.previous
                        viewName.previous = "ChooseMatch"
                    } label: {
                        Image(systemName: "arrowshape.left.circle.fill")
                            .foregroundColor(.cyan)
                            .font(.system(size: 25))
                    }
                    
                    Button("Add Note") {
                        addNote()
                    }
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.cyan)
                }
            }
    }
    
    func addNote() {
        let note = Notes(name: "New Note")
        context.insert(note)
        path = [note]
    }
    
    func deleteNote(_ note: Notes) {
        context.delete(note)
    }
}
