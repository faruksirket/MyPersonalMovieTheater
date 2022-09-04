//
//  ViewController.swift
//  MyPersonalMovieTheater
//
//  Created by faruk sirket on 4.09.2022.
//

import UIKit
import Kingfisher
import Cosmos

class MovieViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var movieViewModel = MovieViewModel.shared
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var collectionView: UICollectionView!
    
    var arrImages = [UIImage(named: "joker")!, UIImage(named: "luck")!, UIImage(named: "prey")!, UIImage(named: "samaritan")!, UIImage(named: "thor")!, UIImage(named: "topgun")!, UIImage(named: "wonder")!]
    var arrTitles = ["Joker", "Luck", "Prey", "Samaritan", "Thor", "Top Gun", "Wonder"]
    var arrOverviews = ["Thor şimdiye kadar karşılaştığı hiçbir maceraya benzemeyen bir yolculuğa çıkıyor; iç huzur yolculuğuna. Ancak emekliliği, tanrıların yok edilmesini isteyen Gorr the God Butcher olarak bilinen galaktik bir katil tarafından kesintiye uğruyor.","300 yıl önce Comanche Nation'da geçen Prey, azılı ve çok yetenekli bir savaşçı olan genç bir kadın olan Naru'nun hikayesini konu ediyor. Great Plains'de dolaşan en efsanevi avcıların gölgesinde büyüyen yetenekli bir kadın savaşçı olan Naru","300 yıl önce Comanche Nation'da geçen Prey, azılı ve çok yetenekli bir savaşçı olan genç bir kadın olan Naru'nun hikayesini konu ediyor. Great Plains'de dolaşan en efsanevi avcıların gölgesinde büyüyen yetenekli bir kadın savaşçı olan Naru,","300 yıl önce Comanche Nation'da geçen Prey, azılı ve çok yetenekli bir savaşçı olan genç bir kadın olan Naru'nun hikayesini konu ediyor. Great Plains'de dolaşan en efsanevi avcıların gölgesinde büyüyen yetenekli bir kadın savaşçı olan Naru,","300 yıl önce Comanche Nation'da geçen Prey, azılı ve çok yetenekli bir savaşçı olan genç bir kadın olan Naru'nun hikayesini konu ediyor. Great Plains'de dolaşan en efsanevi avcıların gölgesinde büyüyen yetenekli bir kadın savaşçı olan Naru,","300 yıl önce Comanche Nation'da geçen Prey, azılı ve çok yetenekli bir savaşçı olan genç bir kadın olan Naru'nun hikayesini konu ediyor. Great Plains'de dolaşan en efsanevi avcıların gölgesinde büyüyen yetenekli bir kadın savaşçı olan Naru,","300 yıl önce Comanche Nation'da geçen Prey, azılı ve çok yetenekli bir savaşçı olan genç bir kadın olan Naru'nun hikayesini konu ediyor. Great Plains'de dolaşan en efsanevi avcıların gölgesinde büyüyen yetenekli bir kadın savaşçı olan Naru,"]
    var timer: Timer?
    var currentCellIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.insetsContentViewsToSafeArea = true
        collectionView.delegate = self
        collectionView.dataSource = self
        pageControl.numberOfPages = arrImages.count
        startTimer()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        movieViewModel.fetchMovies {
            self.tableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow{
            movieViewModel.updateMovieIndex(indexPath.row)
        }
    }
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex() {
        if currentCellIndex < arrImages.count - 1 {
            currentCellIndex += 1
        } else {
            currentCellIndex -= 1
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! SlidingCollectionViewCell
        cell.movieImage.image = arrImages[indexPath.row]
        cell.movieOverview.text = arrTitles[indexPath.row]
        cell.movieTitle.text = arrOverviews[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
 
        cell.configure(movieViewModel.movies[indexPath.row]) //passing data to the method.
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    
}
