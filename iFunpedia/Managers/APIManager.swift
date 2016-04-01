//
//  APIManager.swift
//  Funpedia
//
//  Created by M Usman Saeed on 30/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import Foundation
import Alamofire


@objc protocol APIManagerDelegate: class
{
    optional func didGetAllAudioBooksSuccess(manager: APIManager)
    optional func didFailedToGetAllBooks(manager: APIManager)
    
}


class APIManager:NSObject {
    
    var data:Dict?
    var err:NSError?
    
    var delegate: APIManagerDelegate?
    
    func getAllBooks(param:Dict){
        
        let countryCode = param["countryCode"] as! String
        let typeUrl = param["typeUrl"] as! String
        let typeCode = param["typeCode"] as! String
        let typeName = param["typeName"] as! String
        
//        print(param)
        
        var url:String
        if typeName == "" {
            url = "https://itunes.apple.com/\(countryCode)/rss/\(typeUrl)/limit=2/json"
        }else{
            url = "https://itunes.apple.com/\(countryCode)/rss/\(typeUrl)/limit=2/genre=\(typeCode)/json"
        }
        
//        print(url)
        
        
        Alamofire.request(.GET, url).validate()
            .responseJSON { response in
                switch response.result {
                    
                case .Success:
                    //                    print("Validation Successful")
                    
                    if let JSON = response.result.value {
                        //                        print("JSON: \(JSON)")
                        self.data = JSON as? Dict
                        self.delegate?.didGetAllAudioBooksSuccess!(self)
                    }
                    
                case .Failure(let error):
                    self.err = error
                    self.delegate?.didFailedToGetAllBooks!(self)
                    //                    print(self.err)
                }
        }
    }
}


