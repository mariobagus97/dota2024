//
//  HeroDetailViewController.swift
//  boilerplate mvvm
//

import UIKit
import RxSwift
import RxCocoa
import Cleanse

class HeroDetailViewController: BaseViewController {
    
    @IBOutlet weak var lblBaseAttack: UILabel!
    @IBOutlet weak var lblBaseHealth: UILabel!
    @IBOutlet weak var lblBaseMana: UILabel!
    @IBOutlet weak var lblBaseArmor: UILabel!
    
    @IBOutlet weak var lblPrimaryAttr: UILabel!
    @IBOutlet weak var lblMoveSpeed: UILabel!
    
    @IBOutlet weak var logoPrimaryAttr: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRole: UILabel!
    
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var imgSimilar1: UIImageView!
    @IBOutlet weak var imgSimilar2: UIImageView!
    @IBOutlet weak var imgSimilar3: UIImageView!
    
    var hero : Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baseurl = "https://cdn.akamai.steamstatic.com"
        
        lblBaseAttack.text = String(hero.baseAttackMin) + " - "  + String(hero.baseAttackMax)
        lblBaseMana.text = String(hero.baseMana)
        lblBaseArmor.text = String(hero.baseArmor)
        lblBaseHealth.text = String(hero.baseHealth)
        lblPrimaryAttr.text = hero.primaryAttr.rawValue
        lblMoveSpeed.text = String(hero.moveSpeed)
        lblName.text = hero.localizedName
        lblRole.text = "Role : "+hero.roles.joined(separator: ",")
        
        imgHero.loadImage(fromURL: baseurl + hero.img)
        
        LocalDB().GetHeroes().map { heroes in
            var heroSameAttr = [Hero]()
            
            for  hero in heroes{
                if hero.primaryAttr == self.hero.primaryAttr && !(Set(hero.roles).intersection(self.hero.roles).isEmpty){
                    
                    heroSameAttr.append(hero)
                }
            }
            
            switch hero.primaryAttr {
            case .str :
                heroSameAttr = heroSameAttr.sorted(by: { $0.baseAttackMax > $1.baseAttackMax})
                logoPrimaryAttr.image = UIImage(named:"icDoubleSword")
            case .int :
                heroSameAttr = heroSameAttr.sorted(by: { $0.baseMana > $1.baseMana})
                logoPrimaryAttr.image = UIImage(named:"icBow")
            case .agi :
                heroSameAttr = heroSameAttr.sorted(by: { $0.moveSpeed > $1.moveSpeed})
                logoPrimaryAttr.image = UIImage(named:"icWand")
            case .all:
                heroSameAttr = heroSameAttr.sorted(by: { $0.moveSpeed > $1.moveSpeed && $0.baseMana > $1.baseMana && $0.baseAttackMax > $1.baseAttackMax})
                logoPrimaryAttr.image = UIImage(named:"icAll")
            }
            
            imgSimilar1.loadImage(fromURL: baseurl + heroSameAttr.removeFirst().img)
            imgSimilar2.loadImage(fromURL: baseurl + heroSameAttr.removeFirst().img)
            imgSimilar3.loadImage(fromURL: baseurl + heroSameAttr.removeFirst().img)
            
        }
    }
}
