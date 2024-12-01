//
//  Item.swift
//  Debate
//
//  Created by Chase Ünal on 26.11.2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Notes {
    var name: String
    var full: String
    
    init(name: String) {
        self.name = name
        self.full = ""
    }
}

@Observable
class TimerObject {
    let length: Int
    
    init(length: Int) {
        self.length = length
    }
    
    var timer: Timer? = nil
    
    var isTimerRunning = false
    
    var timeElapsed = 0
    
    var remainingTime: Int {
        length - timeElapsed
        
    }
    
    var progress: CGFloat {
        CGFloat(length - remainingTime) / CGFloat(length)
    }
    
    func startTimer(viewName: ViewName) {
        if(!isTimerRunning) {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
                if remainingTime > 0 {
                    timeElapsed += 1
                } else {
                    if(viewName.name == "PrepTime") {
                        viewName.previous = viewName.name
                        viewName.name = "DebateTime"
                    } else {
                        stopTimer()
                        resetTimer()
                    }
                }
            }
        }
        isTimerRunning = true
    }
    
    func stopTimer() {
        if isTimerRunning {
            isTimerRunning = false
            timer?.invalidate()
        }
    }
    
    func resetTimer() {
        timeElapsed = 0
        isTimerRunning = false
    }
    
}

struct messageObject: Identifiable{
    let id = UUID()
    let messages: String
    
    init(messages: String) {
        self.messages = messages
    }
}

@Observable class ViewName{
    var name: String
    var previous: String
    
    init(name: String, previous: String) {
        self.name = name
        self.previous = previous
    }
}

class Topic: Identifiable {
    let id = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Info : Identifiable {
    let id = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class commentObject: Identifiable{
    let id = UUID()
    let text: String
    let date = Date()
    var likes: Int = 0
    var replies: [commentObject] = []
    
    init(text: String) {
        self.text = text
    }
}

class postObject: Identifiable{
    let id = UUID()
    let text: String
    let date = Date()
    var likes: Int = 0
    var comments: [commentObject] = []
    
    init(text: String) {
        self.text = text
    }
}

enum Teams: String, CaseIterable, Identifiable {
    case openingGovernment, openingOpposition, closingGovernment, closingOpposition
    var id: Self { self }
}

enum Speakers: String, CaseIterable, Identifiable {
    case openingGovernment1, openingGovernment2, openingOpposition1, openingOpposition2, closingGovernment1, closingGovernment2, closingOpposition1, closingOpposition2
    var id: Self { self }
}

enum ScoreType: String, CaseIterable, Identifiable {
    case first, second, third, fourth, fifth, sixth, seventh, eighth
    var id: Self { self }
}

enum Score: String, CaseIterable, Identifiable {
    case one, two, three, four, five
    var id: Self { self }
}
