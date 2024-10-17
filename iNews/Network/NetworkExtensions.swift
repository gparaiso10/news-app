//
//  NetworkExtensions.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 15/10/2024.
//

import Foundation

extension NewsAPI {
    var apiKey: String {
      get {
        guard let filePath = Bundle.main.path(forResource: "NW-Info", ofType: "plist") else {
          fatalError("Couldn't find file 'NW-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY'.")
        }
        return value
      }
    }
}
