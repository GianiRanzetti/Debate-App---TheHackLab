//
//  DebateApp.swift
//  Debate
//
//  Created by Chase Ünal on 26.11.2024.
//

import SwiftUI
import SwiftData

let timerObjectForPrepTime = TimerObject(length: 600)
let timerObjectForDebateTime = TimerObject(length: 300)

@main
struct DebateApp: App {
    
    @Bindable var viewName = ViewName(name: "MainPage", previous: "")
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Notes.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            if(viewName.name == "MainPage") {
                MainPageView(viewName: viewName)
            }
            if(viewName.name == "ProfilePage") {
                ProfilePageView(viewName: viewName)
            }
            if(viewName.name == "PrepTime") {
                PrepTimeView(viewName: viewName, timerObject: timerObjectForPrepTime)
            }
            if(viewName.name == "DebateTime") {
                DebateTimeView(viewName: viewName, timerObject: timerObjectForDebateTime)
            }
            if(viewName.name == "ChooseMatch") {
                ChooseMatchView(viewName: viewName)
            }
            if(viewName.name == "NotesPage") {
                NotesPageView(viewName: viewName)
            }
            if(viewName.name == "Community") {
                CommunityView(viewName: viewName)
            }
            if(viewName.name == "Spectator") {
                SpectatorView(viewName: viewName, timerObject: TimerObject(length: 169))
            }
            if(viewName.name == "Feedback"){
                FeedbackView(viewName: Binding.constant(viewName))
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
