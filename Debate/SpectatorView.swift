//
//  SpectatorView.swift
//  Debate
//
//  Created by Chase Ünal on 27.11.2024.
//

import SwiftData
import SwiftUI

struct SpectatorView: View {
    
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
        .position(x: 200, y: 135)
    }
}
