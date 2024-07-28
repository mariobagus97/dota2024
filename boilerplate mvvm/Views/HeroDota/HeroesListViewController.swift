//
//  HeroesListViewController.swift
//  boilerplate mvvm
//

import UIKit
import RxSwift
import RxCocoa
import Cleanse

class HeroesListViewController: BaseViewController , UICollectionViewDelegate {
    
    let viewModel = try! ComponentFactory.of(HeroesListViewModelComponent.self).build(())
    
    @IBOutlet weak var collectionViewFilter: UICollectionView!
    @IBOutlet weak var collectionViewHeroes: UICollectionView!
    
    let filtercell   = FilterCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("")
        self.navigationItem.title = "All"
        viewModel.getListHeroes()
        setupBinding()
        
        viewModel.AlertError.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (msgError) in
                if !msgError.isEmpty{
                    self.ShowMessage(title : "ERROR" , errorMessage: msgError)
                }
            })
        
        collectionViewFilter.rx
            .modelSelected(String.self)
            .subscribe(onNext:  { value in
                self.viewModel.SelectedFilter(role: value)
                self.navigationItem.title = value
            })
            .disposed(by: disposeBag)
        
        collectionViewHeroes.rx
            .modelSelected(Hero.self)
            .subscribe(onNext:  { value in
                self.gotoDetailhero(hero: value)
            })
            .disposed(by: disposeBag)
        
        
        
        collectionViewHeroes.reloadData()
        collectionViewFilter.reloadData()
    }
    
    private func gotoDetailhero(hero : Hero){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HeroDetailViewController") as! HeroDetailViewController
        viewController.hero = hero
        self.navigationController?.pushViewController(viewController, animated: true)
        //        performSegue(withIdentifier: "", sender: nil)
    }
    
    private func setupBinding(){
        
        collectionViewFilter.register(UINib(nibName: "FilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: FilterCollectionViewCell.self))
        
        collectionViewHeroes.register(UINib(nibName: "HeroesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: HeroesCollectionViewCell.self))
        
        
        viewModel.Roles.bind(to: collectionViewFilter.rx.items(cellIdentifier: "FilterCollectionViewCell", cellType: FilterCollectionViewCell.self)) {  (row,data,cell) in
            cell.lblRoleName.text = data
            
        }.disposed(by: disposeBag)
        
        viewModel.ListHeroes
            .bind(to: collectionViewHeroes.rx.items(cellIdentifier: "HeroesCollectionViewCell", cellType: HeroesCollectionViewCell.self)) {  (row,data,cell) in
                cell.lblName.text = data.localizedName
                cell.imgHero.loadImage(fromURL: "https://cdn.akamai.steamstatic.com" + data.img)
            }.disposed(by: disposeBag)
    }
}


