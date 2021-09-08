//
//  MovieTableviewCellTableViewCell.swift
//  Flixster
//
//  Created by Chandana Pemmasani on 9/1/21.
//

import UIKit

class MovieTableviewCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
