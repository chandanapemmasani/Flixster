//
//  MovieDetailViewController.swift
//  Flixster
//
//  Created by Chandana Pemmasani on 9/17/21.
//

import UIKit

class MovieDetailViewController: UIViewController {

    
    @IBOutlet weak var backDrop: UIImageView!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var synopsysLabel: UILabel!
    
    
    var movie: [String:Any]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movie["title"] as? String
        synopsysLabel.text = movie["overview"] as? String
        
        titleLabel.sizeToFit()
        synopsysLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        
        posterImage.af.setImage(withURL: posterUrl)
        
       
        let backdropPath = movie["backdrop_path"] as! String
        let backdropurl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)!
        
        backDrop.af.setImage(withURL: backdropurl)
    
        
    }
    
    
    

}
