//
//  LocalDB.swift
//  boilerplate mvvm
//


import Foundation
import RealmSwift
class LocalDB {
    
    //    var tokenLogin = try! Realm().objects(TokenLogin.self)
    
    func AddHeroes(data : Data) {
        let realm = try! Realm() //
        var listHeroes = try! Realm().objects(ListHeroes.self) //try! Realm().objects(TokenLogin.self)
        
        if let listHeroes = listHeroes.first {
            try! realm.write {
                listHeroes.JsonHeroes = data
            }
        }
        else {
            try! realm.write { // 2
                let listHeroes = ListHeroes() // 3
                listHeroes.JsonHeroes = data
                realm.add(listHeroes) // 5
            }
        }
    }
    
    func GetHeroes() -> Heroes? {
        let realm = try! Realm() //
        var listHeroes = try! realm.objects(ListHeroes.self) //try! Realm().objects(TokenLogin.self)
        
        
        if let listheroes = listHeroes.first{
            if let jsondata = listheroes.JsonHeroes{
                let heroes = try! JSONDecoder().decode(Heroes.self, from: jsondata)
                return heroes
            }
            else {
                return nil
            }
        }
        else{
            return nil
        }
    }
    
    func AddFilterRoles(Roles : [String]) {
        let realm = try! Realm() //
        var listHeroes = try! Realm().objects(ListHeroes.self) //try! Realm().objects(TokenLogin.self)
        
        if let listHeroes = listHeroes.first {
            if listHeroes.Roles.isEmpty {
                try! realm.write {
                    for role in Roles {
                        listHeroes.Roles.append(role)
                    }
                }
            }
            else {
                try! realm.write { // 2
                    listHeroes.Roles.removeAll()
                    for role in Roles {
                        listHeroes.Roles.append(role)
                    }
                }
            }
            
        }
        else {
            try! realm.write { // 2
                let listHeroes = ListHeroes() // 3
                for role in Roles {
                    listHeroes.Roles.append(role)
                }
                realm.add(listHeroes) // 5
            }
        }
    }
    
    func GetFilterRoles() -> [String] {
        let realm = try! Realm() //
        var listHeroes = try! realm.objects(ListHeroes.self) //try! Realm().objects(TokenLogin.self)
        
        guard let heroes = listHeroes.first else {
            return [String]()
        }
        return Array(heroes.Roles)
        
    }
    
}


class ListHeroes: Object {
    @objc dynamic var JsonHeroes : Data?
    //    @objc dynamic var Roles = [String]()
    var Roles = List<String>()
    //    var arayhero = Heroes
}


