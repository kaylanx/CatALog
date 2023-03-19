//
//  BreedsView.swift
//  CatALog
//
//  Created by Andy Kayley on 14/03/2023.
//

import SwiftUI

struct BreedsView: View {

    @StateObject private var viewModel: BreedViewModel

    init(viewModel: BreedViewModel = BreedViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Group {
            switch viewModel.loadingState {
                case .complete(let breeds) :
                    List {
                        ForEach(breeds) { breed in
                            cell(for: breed)
                        }
                    }
                case .pending, .loading:
                    ProgressView()
                case .error(let error):
                    Text("Oops! Something went wrong \(error.localizedDescription)")
            }
        }
        .task {
            await viewModel.fetchAllBreeds()
        }
    }

    private func cell(for breed: Breed) -> some View {
        HStack {
            image(for: breed)
            name(for: breed)
        }
    }

    private func image(for breed: Breed) -> some View {
        AsyncImage(url: breed.imageURL) { image in
            image
                .resizable()
                .frame(width: 50, height: 50)
        } placeholder: {
            Color.gray
                .frame(width: 50, height: 50)
        }
    }

    private func name(for breed: Breed) -> some View {
        Text(breed.name)
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
