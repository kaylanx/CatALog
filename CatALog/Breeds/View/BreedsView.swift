//
//  BreedsView.swift
//  CatALog
//
//  Created by Andy Kayley on 14/03/2023.
//

import SwiftUI

struct BreedsView: View {

    @ObservedObject var viewModel: BreedViewModel

    init(viewModel: BreedViewModel = BreedViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            ForEach(viewModel.breeds) { breed in
                Text(breed.name)
            }
        }
        .task {
            // TODO: Error handling
            try? await viewModel.fetchAllBreeds()
        }
    }
}

struct BreedsView_Previews: PreviewProvider {
    static var previews: some View {
        BreedsView(
            viewModel: BreedViewModel(
                repository: PreviewBreedRepository()
            )
        )
    }
}
