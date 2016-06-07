//
//  WebAPI.swift
//  redstar
//
//  Created by 王亚南 on 16/6/7.
//  Copyright © 2016年 lelern. All rights reserved.
//

import Foundation

class WebAPI {
    static let QUICK_REGISTER = "api/quickregister/check"
    static let REGISTER = "api/register/add"
    static let OUTTER_SYSTEM = "api/outtersystem/list"
    static let LOGIN = "api/login"
    static let UPDATE_USER = "api/userinfo/update"
    static let APP_FUNCTION = "api/func/show"
    static let BIND_FUNCTION = "api/binduser/bind"
    static let UNBIND_FUNCTION = "api/binduser/unBind"
    static let FEEDBACK = "api/feedback/add"
    static let ESTIMATE_ITEM = "api/estimate/items"
    static let ESTIMATE_ITEM_SUBMIT = "api/estimate/submit"
    static let ESTIMATE_REPORT = "api/estimate/reports"
    static let SINGLE_ESTIMATE_ITEM = "api/estimate/singleitem"
    static let SINGLE_ESTIMATE_REPORT = "api/estimate/singlereport"
    static let SPECIAL_CHECK_ITEM = "api/specialcheck/items"
    static let SPECIAL_CHECK_ITEM_SUBMIT = "api/specialcheck/submit"
    static let PASSPORT = "api/passport/items"
    static let PASSPORT_FILE = "api/passport/files"
    static let PROJECT = "api/common/projects"
    static let UPGRADE = "api/upgrade/info"
    static let NOTIFICATION = "api/notification/info"
    static let TOKEN = "api/common/token"
    
    static let configuration = PropertyHelper.initPlist("Configuration.plist")
    
    static func getWebAPI(methodName: String) -> String{
        return Configuration.instance.getStringValue("Server") + methodName;
    }
    
    static func getFullImagePath(path: String) -> String{
        return Configuration.instance.getStringValue("ImageServer") + path;
    }
}