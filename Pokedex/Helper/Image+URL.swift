//
//  Image+URL.swift
//  Pokedex
//
//  Created by Julien GUERIN on 24/02/2023.
//

import SwiftUI

extension Image {

    func data(url:String) -> Self {
        if let url = URL(string: url), let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
