//
//  AppPages.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import Foundation

enum AppPages: Hashable {
    case main
}

enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case newsDetail
}


//enum FullScreenCover: String, Identifiable {
//    var id: String {
//        self.rawValue
//    }
//    //case ...
//}
