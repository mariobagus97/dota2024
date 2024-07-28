//
//  UrlBuilder.swift
//  boilerplate mvvm
//

import Foundation
import Alamofire
import RxSwift
import Cleanse

class UrlBuilder<T:Codable> {
    
    private let baseUrl = "https://api.opendota.com"
    private var headers : HTTPHeaders = []
    private var URL : String!
    private var parameters: Parameters = [:]
    private let requestHeader : RequestHeader
    
    init(requestHeader : RequestHeader ) {
        self.requestHeader = requestHeader
    }
    
    func SetUrl(urlSegment : String) -> UrlBuilder {
        self.URL = baseUrl + urlSegment
        return self
    }
    
    func SetBasicHeader() -> UrlBuilder {
        self.headers.add(name: "device_utc_offset", value: requestHeader.getDeviceUtcOffset())
        self.headers.add(name: "fcm_token", value: requestHeader.getFcmToken())
        return self
    }
    
    
    func AddLoginHeader(username : String, password : String) -> UrlBuilder {
        let credentialData = "\(username):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        self.headers.add(name: "Authorization", value: "Basic \(base64Credentials)")
        return self
    }
    
    func AddParameter(key : String, value : Any) -> UrlBuilder {
        self.parameters.updateValue(value, forKey: key)
        return self
    }
    
    func AddHeader(key : String, value : String) -> UrlBuilder {
        self.headers.add(name: key, value: value)
        return self
    }
    
    func Execute(httpMethod : HTTPMethod) -> Observable<T> {
        
        Observable<T>.create { (observer) -> Disposable in
            AF.request(self.URL, method: httpMethod, parameters: self.parameters ,encoding: URLEncoding.default, headers: self.headers)
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case .success(let result) :
                        do {
                            if let responseData = response.data {
                                let object = try JSONDecoder().decode(T.self, from: responseData)
                                let localdb = LocalDB()
                                localdb.AddHeroes(data: responseData)
                                observer.onNext(object)
                                observer.onCompleted()
                            }
                        } catch let error {
                            print("Decoding Error: \(error)")
                        }
                    case .failure(let error):
                        if let responseData = response.data {
                            do {
                                let json = try JSONSerialization.jsonObject(with: responseData, options: []) as! [String : String]
                                observer.onError(RuntimeError(json.values.first!))
                            } catch (let err) {
                                observer.onError(err)
                            }
                        }
                        else{
                            if  error.responseCode == 499 {
                                //INVALID SESSION RESPONSE
                                print(error)
                            } else {
                                observer.onError(RuntimeError("Check Your Connection Internet"))
                                print(error)
                            }
                        }
                    }
                }
            return Disposables.create()
        }
    }
}
