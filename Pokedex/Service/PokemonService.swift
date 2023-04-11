//
//  PokemonAPI.swift
//  Pokedex
//
//  Created by Julien GUERIN on 24/02/2023.
//

import Foundation
import Combine

class PokemonService {
    private var cancellables = Set<AnyCancellable>()
    var pokemonListSubject = PassthroughSubject<PokemonList, Never>()

    func getPokemonList() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon")
        let model = APIManager<PokemonList>.RequestModel(url: url, method: .get)

        APIManager.shared.request(with: model)
            .sink (receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case.failure(let error):
                    print(error)
                }
            }, receiveValue: { [weak self] pokemonList in
                guard let self = self else { return }
                self.pokemonListSubject.send(pokemonList)
            })
            .store(in: &self.cancellables)
    }
}
