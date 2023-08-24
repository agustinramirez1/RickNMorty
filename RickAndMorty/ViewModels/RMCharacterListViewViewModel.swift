//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Agustin Ramirez on 2023-08-23.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject {
   public func fetchCharacters() {
        RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharacterResponse.self) { result in
            switch result {
            case .success(let model):
                print("Example image url: "+String(model.results.first?.image ?? "no image"))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ CollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Agustin",
                                                               characterStatus: .alive,
                                                               characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width,
                      height: width * 1.5)
    }
}
