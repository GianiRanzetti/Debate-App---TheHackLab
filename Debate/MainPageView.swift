//
//  MainPageView.swift
//  Debate
//
//  Created by Chase Ünal on 26.11.2024.
//

import SwiftUI
import SwiftData

struct MainPageView: View {
    
    @Bindable var viewName: ViewName

    var body: some View {
            VStack {
                HStack{
                    Button {
                        viewName.previous = viewName.name
                        viewName.name = "NotesPage"
                    } label: {
                        Image(systemName: "square.and.pencil.circle")
                            .font(.system(size: 45))
                            .foregroundColor(.cyan)
                    }
                    
                    Button {
                        viewName.previous = viewName.name
                        viewName.name = "ProfilePage"
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 45))
                            .foregroundColor(.cyan)
                    }
                }
                .position(x: 330, y: 40)
                
                Button {
                    viewName.previous = viewName.name
                    viewName.name = "PrepTime"
                } label: {
                    Text("Join a Debate")
                        .font(.system(size: 45))
                        .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                        .foregroundColor(.cyan)
                                        .padding(.horizontal, -20)
                                        .padding(.vertical, -10))
                        .foregroundColor(.white)
                }
                .position(x: 200, y: 100)
                
                Button {
                    viewName.previous = viewName.name
                    viewName.name = "ChooseMatch"
                } label: {
                    Text("Spectate & Judge")
                        .font(.system(size: 45))
                        .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                        .foregroundColor(.cyan)
                                        .padding(.horizontal, -20)
                                        .padding(.vertical, -10))
                        .foregroundColor(.white)
                }
                .position(x: 200, y: 0)
                
                Button {
                    viewName.previous = viewName.name
                    viewName.name = "Community"
                } label: {
                    Text("Post & Vote")
                        .font(.system(size: 45))
                        .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                        .foregroundColor(.cyan)
                                        .padding(.horizontal, -20)
                                        .padding(.vertical, -10))
                        .foregroundColor(.white)
                }
                .position(x: 200, y: -100)
            }

    }
}
