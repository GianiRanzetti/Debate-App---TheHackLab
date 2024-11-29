//
//  PrepTimeView.swift
//  Debate
//
//  Created by Chase Ünal on 26.11.2024.
//

import SwiftUI
import SwiftData

var messages: [messageObject] = []

struct PrepTimeView: View {
    
    @Bindable var viewName: ViewName
    
    let timerObject: TimerObject
    
    @State private var textValue: String = ""
    
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
                    .onAppear() {
                        timerObject.startTimer(viewName: viewName)
                    }
                Button {
                    viewName.previous = viewName.name
                    viewName.name = "ProfilePage"
                } label: {
                    Image(systemName: "square.and.pencil.circle")
                        .font(.system(size: 50))
                        .foregroundColor(.cyan)
                }
                .position(x: 100,y: 50)
            }
        
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

func seconds_to_minutes(seconds : Int) -> String {
    let result = String(seconds / 60) + ":"
    
    if(seconds % 60 < 10) {
        let result2 = result + "0" + String(seconds % 60)
        return result2
    }
    
    let result3 = result + String(seconds % 60)
    return result3
}
