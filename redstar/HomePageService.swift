//
//  HomePageService.swift
//  redstar
//
//  Created by 王亚南 on 16/6/1.
//  Copyright © 2016年 lelern. All rights reserved.
//

import Foundation

class HomePageService : BaseService {
    
    var topAdvs = [AppFuncInfo]()
    
    var funcMenus = [AppFuncInfo]()
    
    func loadData(){
        var testEntity1 = AppFuncInfo()
        testEntity1.titleImgPath = "M00/00/00/i8S6VVcn_XWAZoSiAALUANzw78M25..jpg"
        topAdvs.append(testEntity1)
        
        var testEntity2 = AppFuncInfo()
        testEntity2.titleImgPath = "M00/00/00/i8S6VVcn_heAOIJmABUaoI8SbsM57..png"
        topAdvs.append(testEntity2)
        
        var testEntity3 = AppFuncInfo()
        testEntity3.titleImgPath = "M00/00/00/i8S6VVcn_mqAfe9bAAUNDAqg4tI45..jpg"
        topAdvs.append(testEntity3)
        
        var testMenu1 = AppFuncInfo()
        testMenu1.title = "流程审批"
        testMenu1.titleImgPath = "M00/00/00/i8S6VVcpig2AQVddAAAD0mKebC872..png"
        funcMenus.append(testMenu1)
        
        var testMenu2 = AppFuncInfo()
        testMenu2.title = "工程进度"
        testMenu2.titleImgPath = "M00/00/00/i8S6VVcpilSAbQ5qAAAGkE8CII478..png"
        funcMenus.append(testMenu2)
        
        var testMenu3 = AppFuncInfo()
        testMenu3.title = "第三方评估"
        testMenu3.titleImgPath = "M00/00/00/i8S6VVcpi_CATU1GAAADIB_jXNg46..png"
        funcMenus.append(testMenu3)
        
        var testMenu4 = AppFuncInfo()
        testMenu4.title = "专项检查"
        testMenu4.titleImgPath = "M00/00/00/i8S6VVcpjECAYf6rAAAERGrzPtE38..png"
        funcMenus.append(testMenu4)
        
        var testMenu5 = AppFuncInfo()
        testMenu5.title = "证照查看"
        testMenu5.titleImgPath = "M00/00/01/i8S6VVdKyS6ANQFgAAAC5d-RyIg02..png"
        funcMenus.append(testMenu5)
        
        var testMenu6 = AppFuncInfo()
        testMenu6.title = "区域联合检查"
        testMenu6.titleImgPath = "M00/00/01/i8S6VVdKyduAfanIAAADtv0quio26..png"
        funcMenus.append(testMenu6)
        
        var testMenu7 = AppFuncInfo()
        testMenu7.title = "安全文明检查"
        testMenu7.titleImgPath = "M00/00/01/i8S6VVdKyfmAPJmuAAADRNDz8o892..png"
        funcMenus.append(testMenu7)
    }
    
    // 重新设定菜单数量使其恰好为整数行
    func sizeToFit(itemCount: Int){
        if funcMenus.count % itemCount != 0 {
            let len = itemCount - funcMenus.count % itemCount
            for _ in 0 ..< len {
                funcMenus.append(AppFuncInfo())
            }
        }
    }
}