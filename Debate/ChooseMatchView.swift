//
//  ChooseMatchView.swift
//  Debate
//
//  Created by Chase Ünal on 27.11.2024.
//

import SwiftData
import SwiftUI

let topics: [Topic] = [
    .init(name: "Topic 1"),
    .init(name: "Topic 2"),
    .init(name: "Topic 3")
]

struct ChooseMatchView: View {
    
    @Bindable var viewName: ViewName
    
    var body: some View {
        Button {
            viewName.name = viewName.previous
            viewName.previous = "ChooseMatch"
        } label: {
            Image(systemName: "arrowshape.right.circle.fill")
                .foregroundColor(.cyan)
                .font(.system(size: 30))
        }
        .offset(x: 165, y: -10)
            List {
                ForEach(topics) { topic in
                    Button (topic.name) {
                        viewName.previous = viewName.name
                        viewName.name = "Spectator"
                    }
                }
            .navigationTitle("Ongoing Debates")
        }
    }
}
