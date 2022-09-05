//
//  ViewModel.swift
//  moviecatalogue
//
//  Created by João Gameiro on 05/09/2022.
//

import Foundation
import Combine

class ViewModel {
    
    @Published var keyWordSearch: String = ""
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        $keyWordSearch.receive(on: RunLoop.main)
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink{(_) in
                self.fetchMovies()
                
            }.store(in: &cancellables)
    }
    
    func fetchMovies() {
        
    }
}
