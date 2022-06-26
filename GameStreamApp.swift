//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 5/6/22.
//

import SwiftUI

@main
struct GameStreamApp: App {
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { phase in
            print(phase)
            if phase == .inactive
            {
                print("the app is inactive , save data")
            }
        }
    }
}
