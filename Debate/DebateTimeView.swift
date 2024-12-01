//
//  DebateTimeView.swift
//  Debate
//
//  Created by Chase Ünal on 26.11.2024.
//

import SwiftData
import SwiftUI

struct DebateTimeView: View {
    
    @Bindable var viewName: ViewName
    
    let timerObject: TimerObject
    
    @State private var textValue = ""
    
    var body: some View {
            HStack{
                Text(seconds_to_minutes(seconds: timerObject.remainingTime))
                    .padding(.all, 5)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        .foregroundColor(.cyan))
                    .position(x: 199,y: 50)
                    .foregroundColor(.white)
                    .monospacedDigit()
                    .font(.system(size: 40))
                    .bold()
                    .contentTransition(.numericText())
                    .animation(.linear, value: timerObject.remainingTime)
                
                
                HStack {
                    Button {
                        timerObject.startTimer(viewName: viewName)
                    } label: {
                        Image(systemName: "play")
                            .foregroundColor(.cyan)
                            .font(.system(size: 50))
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "microphone")
                            .foregroundColor(.cyan)
                            .font(.system(size: 50))
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "hand.raised")
                            .foregroundColor(.cyan)
                            .font(.system(size: 50))
                    }
                }
                
                Button {
                    viewName.previous = viewName.name
                    viewName.name = "NotesPage"
                } label: {
                    Image(systemName: "square.and.pencil.circle")
                        .font(.system(size: 50))
                        .foregroundColor(.cyan)
                }
                .position(x: 50,y: 50)
            }
        
        VStack {
            HStack {
                Text("Speaker1")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))).foregroundStyle(.red)
                Text("Speaker2")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))).foregroundStyle(.red)
            }
            HStack {
                Text("Speaker3")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))).foregroundStyle(.orange)
                Text("Speaker4")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))).foregroundStyle(.orange)
            }
            HStack {
                Text("Speaker5")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))).foregroundStyle(.yellow)
                Text("Speaker6")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))).foregroundStyle(.yellow)
            }
        }
        .position(x: 200, y: 100)
        
        VStack {
            List {
                ForEach(messages) { message in
                    Text(message.messages)
                        .foregroundColor(.white)
                }
                .padding()
                .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .foregroundColor(.green))
            }
            .listStyle(.plain)
        }
        
        HStack {
            TextField("Type message here", text: $textValue)
                .padding()
                .font(.system(size: 20))
            Button {
                let message = messageObject(messages: textValue)
                messages.append(message)
                textValue = ""
            } label: {
                Image(systemName: "paperplane")
                    .font(.system(size: 25))
                    .padding()
            }
        }
    }
}
