//
//  Dependency.swift
//  boilerplate mvvm
//

import Foundation
import Cleanse


struct HeroesListViewModelComponent : RootComponent {
    
    typealias Root = HeroesListViewModel
    
    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.to(factory : Root.init )
    }
    
    static func configure(binder: Binder<Unscoped>) {
        binder
            .include(module: HeroesRepoModule.self)
    }
}
