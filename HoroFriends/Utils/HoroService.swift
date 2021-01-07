//
//  HoroService.swift
//  HoroFriends
//
//  Created by usr on 2021/1/5.
//
import Alamofire
import SwiftyJSON

struct HoroService {
    
    static let shared = HoroService()
    
    func fetchFortunes(completion: @escaping ([Fortune]) -> Void) {
        
        var fortunes = [Fortune]()
        let url = DOMAIN + "web/app/return_complex_fortune.php"
        let parameters = ["os_type": OS_IOS]
        
        AF.request(url, method: .post, parameters: parameters)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { (response) in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let data = json[APIkeys.data].arrayValue
                    for json in data {
                        let fortune = Fortune(json: json)
                        fortunes.append(fortune)
                    }
                case .failure(let error):
                    print(error)
                }
                completion(fortunes)
                
            }
        
        /* ➡️ 原寫法 *//*
        AF.request(url, method: .post, parameters: parameters).responseJSON { response in
            
            switch response.result {
            case .success:
                print("✅ \(#function) Success")
                do {
                    let json = try JSON(data: response.data!)
                    if let results = json["data"].array {
                        for result in results {
                            let fortune = Fortune(dictionary: result.dictionaryObject!)
                            fortunes.append(fortune)
                        }
                        completion(fortunes)
                    }
                } catch {
                    print(error)
                }
            case .failure:
                print("⚠️ \(#function) Failure:")
                print(response.error!)
                completion(fortunes)
            }
            
        }
        */
    }
    
}
