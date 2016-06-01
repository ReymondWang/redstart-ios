//
//  ViewController.swift
//  redstar
//
//  Created by 王亚南 on 16/5/26.
//  Copyright © 2016年 lelern. All rights reserved.
//

import UIKit
import MMDrawerController

class HomePageController: UIViewController {

    // 菜单最小尺寸
    let MENU_MIN_SIZE: CGFloat = 120
    
    // 菜单的间隔
    let MENU_SPACING: CGFloat = 1
    
    // 菜单列数
    let MENU_COLUMNS = 3
    
    let service = HomePageService()
    
    // MARK: - Outlets
    
    @IBOutlet weak var mainContentView: UIScrollView!
    
    @IBOutlet weak var topAdvView: UIScrollView!
    
    @IBOutlet weak var menuView: UICollectionView!
    
    @IBOutlet weak var menuSectionHeight: NSLayoutConstraint!
    
    // MARK: - Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.loadData()
        
        service.sizeToFit(MENU_COLUMNS)
        
        let menuLayout = HomePageMenuLayout(columns: MENU_COLUMNS, itemSpacing: MENU_SPACING, totalWidth: view.frame.width, cellCount: service.funcMenus.count)
        menuView.collectionViewLayout = menuLayout
        
        menuSectionHeight.constant = menuLayout.totalHeight
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        let appDelegte = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegte.centerContainer.openDrawerGestureModeMask = .PanningCenterView
        appDelegte.centerContainer.closeDrawerGestureModeMask = .PanningCenterView
        
        loadTopAdvScroll()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        let appDelegte = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegte.centerContainer.openDrawerGestureModeMask = .None
        appDelegte.centerContainer.closeDrawerGestureModeMask = .None
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return service.funcMenus.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let menuCell = menuView.dequeueReusableCellWithReuseIdentifier("homePageMenuCell", forIndexPath: indexPath) as! HomePageMenuViewCell
        
        let menuItem = service.funcMenus[indexPath.row]
        if (menuItem.titleImgPath != ""){
            menuCell.icon.rs_setImageByUrl(menuItem.titleImgPath, placeHolder: "cc_bg_default_topic_grid")
        }
        menuCell.title.text = menuItem.title
        
        return menuCell
    }
    
    // MARK: - Functions
    
    func loadTopAdvScroll(){
        var totalWidth = CGFloat(0)
        
        for entity in service.topAdvs{
            let imgView = UIImageView(frame: CGRect(x: totalWidth, y: 0 - topAdvView.frame.minY, width: topAdvView.frame.width, height: topAdvView.frame.height))
            imgView.rs_setImageByUrl(entity.titleImgPath)
            
            topAdvView.addSubview(imgView)
            
            totalWidth += topAdvView.frame.width
        }
        
        topAdvView.contentSize = CGSize(width: totalWidth, height: topAdvView.frame.height - topAdvView.frame.minY)
    }
    
    // MARK: - Actions
    
    @IBAction func menuClick(sender: UIBarButtonItem) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }

}

