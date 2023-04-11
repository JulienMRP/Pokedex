//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Julien GUERIN on 24/02/2023.
//

import Foundation
import Combine

class PokemonListViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private var pokemonService = PokemonService()
    
    @Published var pokemonList: PokemonList = PokemonList()

    init() {
        self.getData()
    }

    func getData() {
        print("ok1")
        pokemonService.pokemonListSubject
            .sink(receiveValue: { [weak self] item in
                guard let self = self else { return }
                self.pokemonList = item
            })
            .store(in: &cancellables)

        pokemonService.getPokemonList()
    }

    func getPokemonList() -> PokemonList {
        return self.pokemonList
    }
}
