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
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }
    
    func initView(){
        containerView.layer.cornerRadius = 5
    }
    
    func initCell(product: Product){
        var counter = 0
        
        if let imageStr = product.image{
            imageView.downloadImage(from: imageStr)
        }
        
        /// Plus/Plus48 badge
        if product.linioPlusLevel == 0{
            plusImage.isHidden = true
            
            counter += 1
        }
        if product.linioPlusLevel == 1{
            plusImage.isHidden = false
            plusImage.image = UIImage(named: "plus")
        }
        if product.linioPlusLevel == 2{
            plusImage.isHidden = false
            plusImage.image = UIImage(named: "plus48")
        }
        
        /// Refurbished/new badge
        if product.conditionType == "new"{
            refurbishedImage.image = UIImage(named: "new")
        }
        else if product.conditionType == "refurbished"{
            refurbishedImage.image = UIImage(named: "refurbished")
        }
        
        /// International badge
        if let imported = product.imported{
            if !imported{
                internationalImage.isHidden = true
                counter += 1
            }
            else{
                internationalImage.isHidden = false
            }
        }
        
        /// Free shipping
        if let freeShipping = product.freeShipping{
            if !freeShipping{
                freeShippingImage.isHidden = true
                counter += 1
            }
            else{
                freeShippingImage.isHidden = false
            }
        }
        
        
        let stackViewHeight = self.frame.height * 0.8
        stackView.translatesAutoresizingMaskIntoConstraints = true
        stackView.frame = CGRect(x: 0, y: 0, width: self.frame.width * 0.2, height: stackViewHeight - (CGFloat(counter) * (stackViewHeight / 4)))
        
        for subview in stackView.subviews{
            if !subview.isHidden{
                subview.roundCorners([.layerMinXMinYCorner], radius: 5)
                break
            }
        }
    }

}
