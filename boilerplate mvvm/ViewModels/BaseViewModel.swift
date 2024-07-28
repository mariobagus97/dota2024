//
//  BaseViewModel.swift
//  boilerplate mvvm
//


import Foundation
import RxSwift
import RxCocoa

class BaseViewModel {
    let showLoading = BehaviorRelay<Bool>(value: false)
    var AlertError :  PublishSubject<String> = PublishSubject()
}
