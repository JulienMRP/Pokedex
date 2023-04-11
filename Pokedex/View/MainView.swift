//
//  TabView.swift
//  Pokedex
//
//  Created by Julien GUERIN on 24/02/2023.
//

import SwiftUI

struct MainView: View {
    enum TabItem: String {
        case pokemon = "1"
        case type = "2"
    }

    @State private var selectedTab: TabItem = .pokemon

    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                PokemonListView(viewModel: PokemonListViewModel())
                    .onTapGesture {
                        selectedTab = .pokemon
                    }
                    .tabItem {
                        Label("Pokemon", systemImage: "star")
                    }
                    .tag("One")
                Text("TODO")
                    .onTapGesture {
                        selectedTab = .type
                    }
                    .tabItem {
                        Label("Types", systemImage: "star")
                    }
                    .tag("Two")
            }
            .navigationTitle("Pokedex")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
