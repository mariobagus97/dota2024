//
//  HeroesRepository.swift
//  boilerplate mvvm
//

import Foundation
import RxSwift
import RxCocoa

class HeroesListRepository : IHeroesListRepository  {
    
    private let heroesListService : HeroesListService
    init(heroesListService : HeroesListService) {
        self.heroesListService = heroesListService
    }
    
    func GetListHeroes() -> Single<Heroes> {
        
        let localdb = LocalDB()
        
        guard let heroes = localdb.GetHeroes() else {
            var finalReturn = heroesListService.GetHeroes().map { (value) -> Heroes in
                var randomRoles = [String]()
                randomRoles.append("All")
                for hero in value{
                    for role in hero.roles{
                        randomRoles.append(role)
                    }
                }
                localdb.AddFilterRoles(Roles: Array(Set(randomRoles)))
                return value
            }
            return finalReturn
        }
        return Observable.from(optional: heroes).asSingle()
    }
}
