//
//  FooterViewCell.swift
//  LinioChallenge
//
//  Created by Pablo Ramirez on 6/25/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import UIKit

class FooterViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteIcon: UIImageView!
    @IBOutlet weak var plusImage: UIImageView!
    @IBOutlet weak var internationalImage: UIImageView!
    @IBOutlet weak var refurbishedImage: UIImageView!
    @IBOutlet weak var freeShippingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }
    
    func initView(){
        containerView.layer.cornerRadius = 5
    }
    
    

}
