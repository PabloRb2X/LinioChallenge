//
//  HeaderViewCell.swift
//  LinioChallenge
//
//  Created by Pablo Ramirez on 6/25/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import UIKit
import AlamofireImage

class HeaderViewCell: UICollectionViewCell {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var totalItemsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCell(favorite: Favorite){
        collectionLabel.text = favorite.name
        
        if let products = favorite.products{
            totalItemsLabel.text = String(products.count)
            
            if let imageStr1 = Array(products.values)[0].image{
                //image1.downloadImage(from: imageStr1)
                image1.downloadImageWithAF(urlStr: imageStr1)
                if let imageStr2 = Array(products.values)[1].image{
                    //image2.downloadImage(from: imageStr2)
                    image2.downloadImageWithAF(urlStr: imageStr2)
                    if let imageStr3 = Array(products.values)[2].image{
                        //image3.downloadImage(from: imageStr3)
                        image3.downloadImageWithAF(urlStr: imageStr3)
                    }
                }
            }
        }
    }
    
}
