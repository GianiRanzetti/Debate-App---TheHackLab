//
//  CommunityView.swift
//  Debate
//
//  Created by Chase Ünal on 1.12.2024.

import SwiftUI
import SwiftData

// Post model
struct PostObject: Identifiable {
    let id = UUID() // Unique identifier for each post
    var text: String
    var likes: Int = 0 // Track likes
    var dislikes: Int = 0 // Track dislikes
}

struct CommunityView: View {
    
    @Bindable var viewName: ViewName
    
    @State private var textValue = ""
    @State private var posts: [PostObject] = [] // Stateful posts array
    
    var body: some View {
        // Back button
        Button {
            viewName.name = viewName.previous
            viewName.previous = "Community"
        } label: {
            Image(systemName: "arrowshape.left.circle.fill")
        }
        .font(.system(size: 30))
        .foregroundColor(.cyan)
        .offset(x: -160)
        
        VStack {
            // List of posts
            List {
                ForEach(posts.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 8) {
                        // Display post text
                        Text(posts[index].text)
                            .padding(.bottom, 4)

                        // Separate buttons for likes and dislikes
                        HStack(spacing: 20) {
                            // Likes Button
                            HStack {
                                Button {
                                    posts[index].likes += 1 // Increment likes
                                } label: {
                                    HStack {
                                        Image(systemName: "hand.thumbsup.fill")
                                        Text("\(posts[index].likes)")
                                            .font(.subheadline)
                                    }
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }

                            // Dislikes Button
                            HStack {
                                Button {
                                    posts[index].dislikes += 1 // Increment dislikes
                                } label: {
                                    HStack {
                                        Image(systemName: "hand.thumbsdown.fill")
                                        Text("\(posts[index].dislikes)")
                                            .font(.subheadline)
                                    }
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                    .padding(.vertical, 8) // Add padding between posts
                }
            }
        }
        
        // Post creation UI
        HStack {
            TextField("Send a post", text: $textValue)
                .padding()
                .font(.system(size: 20))
            
            Button {
                // Add new post with default likes/dislikes
                let post = PostObject(text: textValue)
                posts.append(post) // Append to stateful posts array
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
