//
//  HeroesListViewModel.swift
//  boilerplate mvvm
//


import Foundation
import RxSwift

class HeroesListViewModel: BaseViewModel {
    
    private var repo: IHeroesListRepository
    init(repo : IHeroesListRepository) {
        self.repo = repo
    }
    
    public let ListHeroes = BehaviorSubject<Heroes>(value: [Hero]()) //PublishSubject<Heroes> = PublishSubject()
    public let Roles = BehaviorSubject<[String]>(value: [String]())//: PublishSubject<[String]> = PublishSubject()
    
    func getListHeroes() {
        repo.GetListHeroes()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { (hasil) in
                self.ListHeroes.onNext(hasil)
                self.Roles.onNext(LocalDB().GetFilterRoles())
            }) { (error) in
                print(error)
                let errorMessage = error as! RuntimeError
                self.AlertError.onNext(errorMessage.message)
            }
        
    }
    
    func SelectedFilter(role : String){
        if role != "All"{
            repo.GetListHeroes()
                .map { (heroes) -> [Hero] in
                    var arrayHeroes = Heroes()
                    for var hero in heroes{
                        if hero.roles.contains(where: {$0 == role}) {
                            arrayHeroes.append(hero)
                        }
                    }
                    return arrayHeroes
                }
                .observeOn(MainScheduler.instance)
                .subscribe(onSuccess: { (hasil) in
                    self.ListHeroes.onNext(hasil)
                }) { (error) in
                    print(error)
                    let errorMessage = error as! RuntimeError
                    self.AlertError.onNext(errorMessage.message)
                }
        }
        else{
            getListHeroes()
        }
    }}
