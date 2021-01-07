//
//  Fortune.swift
//  HoroFriends
//
//  Created by usr on 2021/1/7.
//

import SwiftyJSON

struct Fortune {
    let h_id: String
    let horo_name: String
    let sort_index: Int
    let comment: String
    let complex: String
    
    init(json: JSON) {
        self.h_id = json[APIkeys.horoId].stringValue
        self.horo_name = json[APIkeys.horoName].stringValue
        self.sort_index = json[APIkeys.sortIndex].intValue
        self.comment = json[APIkeys.comment].stringValue
        self.complex = json[APIkeys.complex].stringValue
    }
}
