//
//  ImageUtil.swift
//  redstar
//
//  Created by 王亚南 on 16/6/1.
//  Copyright © 2016年 lelern. All rights reserved.
//

import Foundation
import AlamofireImage

extension UIImageView{
    public func rs_setImageByUrl(url: String){
        rs_setImageByUrl(url, placeHolder: "cc_bg_default_image")
    }
    
    public func rs_setImageByUrl(url: String, placeHolder: String){
        let placeHolder = UIImage(named: placeHolder)
        let fetchUrl = Configuration.IMAGE_SERVER + url
        if let imgUrl = NSURL(string: fetchUrl) {
            self.af_setImageWithURL(imgUrl, placeholderImage: placeHolder)
        }
    }
}