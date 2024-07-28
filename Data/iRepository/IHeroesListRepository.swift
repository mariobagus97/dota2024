//
//  IHeroesListRepository.swift
//  boilerplate mvvm
//

import Foundation
import RxSwift

protocol IHeroesListRepository {
    func GetListHeroes() -> Single<Heroes>
}
