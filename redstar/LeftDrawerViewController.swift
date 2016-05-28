//
//  MainMenuViewController.swift
//  redstar
//
//  Created by 王亚南 on 16/5/27.
//  Copyright © 2016年 lelern. All rights reserved.
//

import UIKit

class LeftDrawerViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var mUserHeadImage: UIImageView!
    
    @IBOutlet weak var mUserName: UILabel!
    
    @IBOutlet weak var mUserEmail: UILabel!
    
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - DataSource
    let menuNameArr = ["系统设置", "离线任务", "清楚缓存", "意见反馈", "检查更新", "关于我们", "退出登录"]
    let menuIconArr = ["ic_settings_gray", "ic_cloud_done_gray", "ic_delete_sweep_primary", "ic_send_gray", "ic_sync_gray", "ic_group_gray", "ic_vertical_align"]
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return menuNameArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let tableCell = mTableView.dequeueReusableCellWithIdentifier("menuCell")!
        
        tableCell.textLabel?.text = menuNameArr[indexPath.row]
        tableCell.imageView?.image = UIImage(named: menuIconArr[indexPath.row])
        
        return tableCell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
