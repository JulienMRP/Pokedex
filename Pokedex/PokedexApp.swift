//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Julien GUERIN on 22/02/2023.
//

import SwiftUI

@main
struct PokedexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
