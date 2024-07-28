//
//  FilterCollectionViewCell.swift
//  boilerplate mvvm
//


import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewFrame: UIView!
    @IBOutlet weak var lblRoleName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewFrame.layer.cornerRadius = 20
    }
}
