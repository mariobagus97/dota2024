//
//  BaseViewController.swift
//  boilerplate mvvm
//

import UIKit
//import JGProgressHUD
import RxSwift
import RxCocoa
import Cleanse

class BaseViewController: UIViewController{
    
//    let LoadingIndicator = JGProgressHUD(style: .dark)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        LoadingIndicator.textLabel.text = "Loading"
    }
    
    func ShowMessage(title : String, errorMessage : String) {
        let uialert = UIAlertController(title: title, message: errorMessage
                                        , preferredStyle: UIAlertController.Style.alert)
        uialert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(uialert, animated: true, completion: nil)
    }
    
}
