//
//  MoviesViewController.swift
//  Flixster
//
//  Created by Chandana Pemmasani on 9/1/21.
//

import UIKit
import AlamofireImage


class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var moviesTableview: UITableView!
    

    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        callMoviesAPI()
    }
    
    func callMoviesAPI() {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.movies =  dataDictionary["results"] as! [[String : Any]]
                self.moviesTableview.reloadData()

             }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = moviesTableview.dequeueReusableCell(withIdentifier: "MovieTableviewCellTableViewCell", for: indexPath) as! MovieTableviewCellTableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.movieDescription.text = movie["overview"] as? String
        
        cell.movieName.text = movie["title"] as? String
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        
        cell.movieImg.af.setImage(withURL: posterUrl)
        
        return cell
    }
    
}