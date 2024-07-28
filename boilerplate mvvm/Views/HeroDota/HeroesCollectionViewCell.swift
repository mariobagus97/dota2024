//
//  HeroesCollectionViewCell.swift
//  boilerplate mvvm
//

import UIKit

class HeroesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgHero.layer.cornerRadius = 5
    }
}
