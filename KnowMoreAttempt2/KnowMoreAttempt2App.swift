//
//  KnowMoreAttempt2App.swift
//  KnowMoreAttempt2
//
//  Created by Nadia Kiblisky on 5/11/24.
//

import SwiftUI

@main
struct KnowMoreAttempt2App: App {
    var body: some Scene {
        WindowGroup {
            WelcomeScreen(highScoreViewManager: HighScoreViewModel())
        }
    }
}
