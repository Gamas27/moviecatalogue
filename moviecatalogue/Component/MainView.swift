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

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
}

extension MainView {
    func registerCell() {
        let movieCell = UINib(nibName: MovieCell.reuseIdentifier, bundle: nil)
        tableview.register(movieCell, forCellReuseIdentifier: MovieCell.reuseIdentifier)
    }
}
