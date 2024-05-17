//
//  KnowMoreAttempt2App.swift
//  KnowMoreAttempt2
//
//  Created by Nadia Kiblisky on 5/11/24.
//

import SwiftUI
import FirebaseCore

@main
struct KnowMoreAttempt2App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
