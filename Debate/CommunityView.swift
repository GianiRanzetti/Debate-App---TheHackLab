//
//  CommunityView.swift
//  Debate
//
//  Created by Chase Ünal on 1.12.2024.

import SwiftUI
import SwiftData

var posts: [postObject] = []

struct CommunityView: View {
    
    @Bindable var viewName: ViewName
    
    @State private var textValue = ""
    @State var likes: Int = 0
    @State var dislike: Int = 0
    
    var body: some View {
        Button {
            viewName.name = viewName.previous
            viewName.previous = "Community"
        } label: {
            Image(systemName: "arrowshape.left.circle.fill")
        }
        .font(.system(size: 25))
        .foregroundColor(.cyan)
        .offset(x: -160)
        
        VStack {
            List {
                ForEach(posts) { post in
                    Text(post.text)
                    HStack{
                        Text("\(likes)")
                        Button {
                            likes += 1
                        } label: {
                            Image(systemName: "hand.thumbsup")
                        }
                        Text("\(dislike)")
                        Button {
                            dislike += 1
                        } label: {
                            Image(systemName: "hand.thumbsdown")
                        }
                    }
            }
            }
        }
        HStack {
            TextField("Send a post", text: $textValue)
                .padding()
                .font(.system(size: 20))
            Button {
                let post = postObject(text: textValue)
                posts.append(post)
                textValue = ""
            } label: {
                Image(systemName: "paperplane")
                    .font(.system(size: 25))
                    .padding()
            }
        }
        .offset(y: 0)
    }
}
