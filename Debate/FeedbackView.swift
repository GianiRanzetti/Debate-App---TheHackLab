//
//  FeedbackView.swift
//  Debate
//
//  Created by Justin Tang on 2/12/2024.
//

import SwiftUI
import SwiftData
import OpenAI

class SimpleChatViewModel: ObservableObject {
    @Published var responseText: String = ""
    @Published var noteContent: String
    
    private let openAI = OpenAI(apiToken: "PUT API KEY HERE") //Replace with actual API Key
    
    init(noteContent: String) {
        self.noteContent = noteContent
        self.responseText =  ("Response: \(noteContent)")
    }
    
    func sendMessage() {
        let query = ChatQuery(
            messages: [
                .init(role: .user, content: "Provide very concise, bullet-pointed feedback on this debate argument (no formatting required, just bullets), giving a score rating out of 10 (give the score upfront): \(noteContent)")!
            ],
            model: .gpt4_o_mini
        )
        
        openAI.chats(query: query) { [weak self] result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.responseText = success.choices.first?.message.content?.string ?? "No response"
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.responseText = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}

struct FeedbackView: View {
    @Binding var viewName: ViewName
    @Query private var notes: [Notes] // Fetches all notes
    @StateObject private var viewModel: SimpleChatViewModel
    
    init(viewName: Binding<ViewName>) {
        self._viewName = viewName
        self._viewModel = StateObject(wrappedValue: SimpleChatViewModel(noteContent: ""))
    }
    
    var body: some View {
        
        HStack{
            Text("Feedback")
                .padding(.all, 5)
                .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .foregroundColor(.cyan))
                .position(x: 199,y: 50)
                .foregroundColor(.white)
                .monospacedDigit()
                .font(.system(size: 26))
                .bold()
            Button {
                viewName.previous = viewName.name
                viewName.name = "NotesPage"
            } label: {
                Image(systemName: "square.and.pencil.circle")
                    .font(.system(size: 50))
                    .foregroundColor(.cyan)
            }
            .position(x:170, y: 50)
            Button {
                viewName.previous = viewName.name
                viewName.name = "MainPage"
            } label: {
                Image(systemName: "arrowshape.right.circle.fill")
                    .foregroundColor(.cyan)
                    .font(.system(size: 50))
            }
            .position(x:90, y: 50)
        }
        
        // Note Feedback Section
        
        VStack {
            if let firstNote = notes.first {
                
                // Note Section
                VStack {
                    ScrollView {
                        Text("Your Notes: \(firstNote.name)")
                            .font(.headline)
                            .padding(.top)
                        Text(firstNote.full)
                            .font(.body)
                            .padding()
                            .border(Color.gray, width: 1)
                            .padding(.horizontal)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 300) // Adjust height
                .background(Color.white)
                .position(x:190,y:-170)
                .padding(.bottom, 10)
                
                // Feedback Button Section
                VStack {
                    Button("Get Feedback from AI") {
                        viewModel.noteContent = firstNote.full
                        viewModel.sendMessage()
                    }
                    .foregroundColor(.cyan)
                    .padding()
                    .font(.system(size: 25))
                }
                .frame(maxWidth: .infinity)
                .position(x:190, y:-85)
                .padding(.bottom, 10)
                
                // Feedback Section
                VStack {
                    ScrollView {
                        Text(viewModel.responseText)
                            .padding()
                            .padding(.horizontal)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 250) // Adjust height
                .background(Color.white)
                .position(x:190, y:-70)
                .padding(.top, 10)
                
            } else {
                // No Notes Available Section
                VStack {
                    Text("No notes available.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding()
        .onAppear {
            if let firstNote = notes.first {
                viewModel.noteContent = firstNote.full
            }
        }
        
    }
}
