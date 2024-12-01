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
    
    @State private var bestTeam: Teams = .openingGovernment
    @State private var bestSpeaker: Speakers = .openingGovernment1
    @State private var chosenSpeaker: Speakers = .openingGovernment1
    @State private var scoreType: ScoreType = .first
    @State private var score: Score = .one
    
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
            Button {
                viewName.name = viewName.previous
                viewName.previous = "MainPage"
            } label: {
                Image(systemName: "arrowshape.left.circle.fill")
            }
            .offset(x: -350, y: -50)
            .font(.system(size: 30))
        }
        .onAppear {
            timerObject.startTimer(viewName: viewName)
        }
        VStack {
            Button {
                viewName.previous = viewName.name
                viewName.name = "NotesPage"
            } label: {
                Image(systemName: "square.and.pencil.circle")
                    .font(.system(size: 50))
                    .foregroundColor(.cyan)
            }
            HStack {
                List{
                    Picker("Best Team", selection: $bestTeam) {
                        Text("Opening Government").tag(Teams.openingGovernment)
                        Text("Opening Opposition").tag(Teams.openingOpposition)
                        Text("Closing Government").tag(Teams.closingGovernment)
                        Text("Closing Opposition").tag(Teams.closingOpposition)
                    }
                    
                    Picker("Best Speaker", selection: $bestSpeaker) {
                        Text("Opening Government 1").tag(Speakers.openingGovernment1)
                        Text("Opening Government 2").tag(Speakers.openingGovernment2)
                        Text("Opening Opposition 1").tag(Speakers.openingOpposition1)
                        Text("Opening Opposition 2").tag(Speakers.openingOpposition2)
                        Text("Closing Government 1").tag(Speakers.closingGovernment1)
                        Text("Closing Government 2").tag(Speakers.closingGovernment2)
                        Text("Closing Opposition 1").tag(Speakers.closingOpposition1)
                        Text("Closing Opposition 2").tag(Speakers.closingOpposition2)
                    }
                    
                    VStack {
                        Picker("Chosen Speaker", selection: $bestSpeaker) {
                            Text("Opening Government 1").tag(Speakers.openingGovernment1)
                            Text("Opening Government 2").tag(Speakers.openingGovernment2)
                            Text("Opening Opposition 1").tag(Speakers.openingOpposition1)
                            Text("Opening Opposition 2").tag(Speakers.openingOpposition2)
                            Text("Closing Government 1").tag(Speakers.closingGovernment1)
                            Text("Closing Government 2").tag(Speakers.closingGovernment2)
                            Text("Closing Opposition 1").tag(Speakers.closingOpposition1)
                            Text("Closing Opposition 2").tag(Speakers.closingOpposition2)
                        }
                        Picker("Chosen Evaluation", selection: $scoreType) {
                            Text("1.").tag(ScoreType.first)
                            Text("2.").tag(ScoreType.second)
                            Text("3.").tag(ScoreType.third)
                            Text("4.").tag(ScoreType.fourth)
                            Text("5.").tag(ScoreType.fifth)
                            Text("6.").tag(ScoreType.sixth)
                            Text("7.").tag(ScoreType.seventh)
                            Text("8.").tag(ScoreType.eighth)
                        }
                        .pickerStyle(.segmented)
                        Picker("Score", selection: $score) {
                            Text("1.").tag(Score.one)
                            Text("2").tag(Score.two)
                            Text("3").tag(Score.three)
                            Text("4").tag(Score.four)
                            Text("5").tag(Score.five)
                        }
                        .pickerStyle(.segmented)
                    }
                }
                .listStyle(.plain)
            }
        }
        .offset(y: -125)
        .frame(height: 300)
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
            HStack {
                Text("Speaker7")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))).foregroundStyle(.blue)
                Text("Speaker8")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))).foregroundStyle(.blue)
            }
        }
        .position(x: 200, y: 40)
    }
}
