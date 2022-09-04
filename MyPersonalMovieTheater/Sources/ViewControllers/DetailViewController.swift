//
//  DetailViewController.swift
//  MyPersonalMovieTheater
//
//  Created by faruk sirket on 4.09.2022.
//

import UIKit
import Kingfisher
import Cosmos
import AVFoundation

class DetailViewController: UIViewController {

    var movieViewModel = MovieViewModel.shared 


    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
    @IBOutlet var starRating: UILabel!
    @IBOutlet var imdbImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingUpUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    
    
    
    func settingUpUI(){
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        print(movieViewModel.movies.count)
        movieTitle.text = movieViewModel.movies[movieViewModel.fetchMovieIndex()].title
        movieOverview.text = movieViewModel.movies[movieViewModel.fetchMovieIndex()].overview
        let imagePath = movieViewModel.movies[movieViewModel.fetchMovieIndex()].posterPath
        let url = URL(image: imagePath)
        movieImg.kf.setImage(with: url)
        imdbImage.image = UIImage(named: "imdb")
        starRating.text = "⭐ \(movieViewModel.movies[movieViewModel.fetchMovieIndex()].rating)/10 🟡 \(movieViewModel.movies[movieViewModel.fetchMovieIndex()].dateFormatter())"
        self.navigationItem.title = movieViewModel.movies[movieViewModel.fetchMovieIndex()].title
    
    }
}





