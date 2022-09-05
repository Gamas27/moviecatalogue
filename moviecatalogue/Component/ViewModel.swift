//
//  ViewModel.swift
//  moviecatalogue
//
//  Created by João Gameiro on 05/09/2022.
//
import UIKit
import Foundation
import Combine

class ViewModel {
    let serviceProvider = Service.sharedInstance

    @Published var keyWordSearch: String = ""

    var cancellables: Set<AnyCancellable> = []
    var diffableDataSource: MoviesTableViewDiffableDataSource!
    var snapshot = NSDiffableDataSourceSnapshot<String?, Result>()

    init() {
        $keyWordSearch.receive(on: RunLoop.main)
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink {(_) in
                self.fetchMovies()

            }.store(in: &cancellables)
    }

    func fetchMovies() {
        serviceProvider.fetchFilms(for: keyWordSearch) { (results) in
            guard self.diffableDataSource != nil else { return }

            self.snapshot.deleteAllItems()
            self.snapshot.appendSections([""])

            if results.isEmpty {
                self.diffableDataSource.apply(self.snapshot, animatingDifferences: true)
                return
            }

            self.snapshot.appendItems(results, toSection: "")
            self.diffableDataSource.apply(self.snapshot, animatingDifferences: true)
        }
    }
}
