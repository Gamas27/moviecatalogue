//
//  MovieCell.swift
//  moviecatalogue
//
//  Created by João Gameiro on 05/09/2022.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDetailsLabel: UILabel!

    var movieObject: Result! {
        didSet {
            setupData()
        }
    }

    func setupData() {
        guard let unwrappedMovieName = movieObject.title,
            let unwrappedMovieDetails = movieObject.resultDescription
        else { return }

        movieNameLabel.text = unwrappedMovieName
        movieDetailsLabel.text = unwrappedMovieDetails

        if let unwrappedMovieImage = movieObject.image,
        let imageURL = URL(string: unwrappedMovieImage) {
            movieImageView.activateSdWebImageLoader()
            movieImageView.sd_setImage(with: imageURL, completed: nil)
        } else {
            movieImageView.image = UIImage(named: "placeholder-image")
        }
    }
}
