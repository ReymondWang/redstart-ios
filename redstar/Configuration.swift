//
//  Configuration.swift
//  redstar
//
//  Created by 王亚南 on 16/6/1.
//  Copyright © 2016年 lelern. All rights reserved.
//

import Foundation

class Configuration {
    static let instance = Configuration()
    
    private var dictionary: NSDictionary?
    
    private init() {
        dictionary = PropertyHelper.initPlist("Configuration.plist")
    }
    
    func getStringValue(key: String) -> String {
        return dictionary?.valueForKey(key) as! String
    }
    
    func getIntValue(key: String) -> Int {
        if let str = dictionary?.valueForKey(key) {
            return Int(str as! NSNumber)
        }
        return 0
    }
}