//
//  HeroesListService.swift
//  boilerplate mvvm
//


import Foundation
import RxSwift

class HeroesListService {
    
    private let header : RequestHeader
    init(header : RequestHeader) {
        self.header = header
    }
    
    func GetHeroes() -> Single<Heroes> {
        return UrlBuilder<Heroes>(requestHeader: header)
            .SetUrl(urlSegment: "/api/herostats")
            .SetBasicHeader()
            .Execute(httpMethod: .get)
            .asSingle()
    }
}
