//
//  HomePageMenuLayout.swift
//  redstar
//
//  Created by 王亚南 on 16/6/1.
//  Copyright © 2016年 lelern. All rights reserved.
//

import UIKit

class HomePageMenuLayout: UICollectionViewLayout {
    var columns = 0
    
    var rows: Int {
        return cellCount / columns
    }
    
    var itemSpacing: CGFloat = 0
    
    var cellCount = 0
    
    var totalWidth: CGFloat = 0
    
    var cellSize: CGFloat {
        return (totalWidth - itemSpacing * CGFloat(columns + 1)) / CGFloat(columns)
    }
    
    var remainSize: CGFloat {
        if UIScreen.mainScreen().scale == 2 {
            return 4
        } else {
            return 0
        }
    }
    
    var totalHeight: CGFloat {
        return (cellSize + itemSpacing) * CGFloat(rows) + itemSpacing
    }
    
    init(columns: Int, itemSpacing: CGFloat, totalWidth: CGFloat, cellCount: Int) {
        super.init()
        self.columns = columns
        self.itemSpacing = itemSpacing
        self.totalWidth = totalWidth
        self.cellCount = cellCount
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var attributeDic = [String: UICollectionViewLayoutAttributes]()
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        if attributeDic.count == 0 {
            let cellCount = collectionView!.numberOfItemsInSection(0)
            for i in 0..<cellCount {
                let indexPath = NSIndexPath(forItem:i, inSection:0)
                let attributes = layoutAttributesForItemAtIndexPath(indexPath)
                
                attributesArray.append(attributes!)
            }
        } else {
            for (key, value) in attributeDic {
                let cellRect = CGRectFromString(key)
                if CGRectIntersectsRect(rect, cellRect) {
                    attributesArray.append(value)
                }
            }
        }
        
        return attributesArray
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute =  UICollectionViewLayoutAttributes(forCellWithIndexPath:indexPath)
        
        let insets = UIEdgeInsetsMake(itemSpacing, itemSpacing, itemSpacing, itemSpacing)
        
        let curColumn = indexPath.row % columns
        let curRow = indexPath.row / columns
        
        let startX = CGFloat(curColumn) * (cellSize + itemSpacing) + insets.left + remainSize
        let startY = CGFloat(curRow) * (cellSize + itemSpacing) + insets.top
        let width = cellSize
        let height = cellSize
        
        attribute.frame = CGRectMake(startX, startY, width, height)
        
        attributeDic.updateValue(attribute, forKey: NSStringFromCGRect(attribute.frame))
        
        return attribute
    }
    
    
    
}
