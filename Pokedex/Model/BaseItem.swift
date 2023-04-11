//
//  BaseItem.swift
//  Pokedex
//
//  Created by Julien GUERIN on 22/02/2023.
//

import Foundation
import SwiftUI

class BaseItem: Codable {
    let name: String
    let url: String

    func getId() -> String {
        let tab = self.url.components(separatedBy: "/")
        return tab[tab.count - 2]
    }

    func getImageUrl() -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(self.getId()).png"
    }
}

