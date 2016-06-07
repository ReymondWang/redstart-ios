//
//  PropertyHelper.swift
//  redstar
//
//  Created by 王亚南 on 16/6/7.
//  Copyright © 2016年 lelern. All rights reserved.
//

import Foundation

class PropertyHelper {
    static func initPlist(fileName: String) -> NSDictionary? {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0] as String
        let path = documentsDirectory.stringByAppendingString("/" + fileName)
        
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(path) {
            do {
                try fileManager.removeItemAtPath(path)
            } catch {
                print("delete \(fileName) file error")
            }
        }
        
        if let bundlePath = NSBundle.mainBundle().pathForResource("Configuration", ofType: "plist") {
            let resultDictionary = NSMutableDictionary(contentsOfFile: path)
            print("Bundle \(fileName) file is --> \(resultDictionary?.description)")
            do {
                try fileManager.copyItemAtPath(bundlePath, toPath: path)
            } catch {
                print("Copy \(fileName) file error")
            }
        } else {
            print("\(fileName) file is not existed")
            return nil
        }
        
        let resultDictionary = NSDictionary(contentsOfFile: path)
        return resultDictionary
    }
}