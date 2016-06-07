//
//  HomePageMenuViewCell.swift
//  redstar
//
//  Created by 王亚南 on 16/6/1.
//  Copyright © 2016年 lelern. All rights reserved.
//

import UIKit

class HomePageMenuViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleView: UILabel!
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var notificationView: UILabel!
    
    var title: String? {
        didSet{
            titleView.text = title
        }
    }
    
    var icon: String?{
        didSet{
            if let imageUrl = icon {
                if imageUrl != "" {
                   iconView.rs_setImageByUrl(imageUrl, placeHolder: "cc_bg_default_topic_grid")
                }
            }
        }
    }
    
    var notification: String? {
        didSet{
            if let cntStr = notification {
                if (Int(cntStr) != nil) {
                    notificationView.hidden = false
                    notificationView.layer.masksToBounds = true
                    notificationView.layer.cornerRadius = notificationView.frame.width / 2
                    notificationView.text = notification
                }
            }
            
        }
    }
    
}
