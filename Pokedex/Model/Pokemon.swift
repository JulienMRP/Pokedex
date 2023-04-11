//
//  Pokemon.swift
//  Pokedex
//
//  Created by Julien GUERIN on 22/02/2023.
//

import Foundation

class PokemonList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [BaseItem]

    init() {
        self.count = 0
        self.next = ""
        self.previous = ""
        self.results = []
    }
}

class Pokemon: Codable {

}
