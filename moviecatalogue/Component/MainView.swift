//
//  MainView.swift
//  moviecatalogue
//
//  Created by João Gameiro on 05/09/2022.
//

import UIKit
import Combine

class MoviesTableViewDiffableDataSource: UITableViewDiffableDataSource<String?, Result> {}

class MainView: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!

    @Published var keyStroke: String = ""

    var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
}

// MARK: - Setup UI & Cells
extension MainView {
    func registerCell() {
        let movieCell = UINib(nibName: MovieCell.reuseIdentifier, bundle: nil)
        tableview.register(movieCell, forCellReuseIdentifier: MovieCell.reuseIdentifier)
    }
}

// MARK: - UISearchBar Delegate
extension MainView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.keyStroke = searchText
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.keyStroke = ""
    }
}

// MARK: - Observers
extension MainView {
    func setupObservers() {
        // Monitor search bar textfield keystrokes
        $keyStroke
            .receive(on: RunLoop.main)
            .sink { (keyWordValue) in
                print(keyWordValue)
            }.store(in: &cancellables)
    }
}
