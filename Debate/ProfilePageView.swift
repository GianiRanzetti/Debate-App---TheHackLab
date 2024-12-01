//
//  ProfilePageView.swift
//  Debate
//
//  Created by Chase Ünal on 26.11.2024.
//

import SwiftUI
import SwiftData

let myInfo: [Info] = [
    .init(name: "Username: HackingtheHAcklab001"),
    .init(name: "email: email@example.com"),
    .init(name: "Elo: 0000"),
    .init(name: "Leaderboard Rank: 0000")
]

struct ProfilePageView: View {
    
    @Bindable var viewName: ViewName
    
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    
                    Text("My Profile")
                        .font(.title)
                        .offset(x: -5, y: 10)
                }
                List {
                    ForEach(myInfo) { info in
                        Text(info.name)
                    }
                }
                .padding()
                Button {
                    
                }label: {
                    Text("Edit Profile").foregroundColor(.blue)
                }
                Button {
                    
                } label: {
                    Text("Delete Account")
                        .foregroundColor(.red)
                }
            }
            Color.teal.opacity(0.1).ignoresSafeArea()
            Button {
                viewName.name = viewName.previous
                viewName.previous = "ProfilePage"
            } label: {
                Image(systemName: "arrowshape.left.circle.fill")
            }
            .offset(x: -160, y: -360)
            .font(.system(size: 35))
            .foregroundColor(.cyan)
        }
    }
}
