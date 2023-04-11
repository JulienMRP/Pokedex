//
//  ContentView.swift
//  Pokedex
//
//  Created by Julien GUERIN on 22/02/2023.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var viewModel: PokemonListViewModel

    var body: some View {
        VStack {
            let pokemonList = viewModel.getPokemonList()

            List(pokemonList.results, id: \.name) { pokemon in
                VStack (alignment: .center){
                    Image(systemName: "person.fill")
                        .data(url: pokemon.getImageUrl())
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Text(pokemon.name)
                }
            }
        }
        .onAppear{
            viewModel.getData()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(viewModel: PokemonListViewModel())
    }
}
