//
//  UserlistController.swift
//  CytubeChat1.0
//
//  Created by Erik Little on 10/20/14.
//

import UIKit

class UserlistController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var room:CytubeRoom!
    @IBOutlet var userlistTitle:UINavigationItem!
    @IBOutlet var tblUserlist:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        room = roomMng.getActiveRoom()
        userlistTitle.title = room.roomName + " Userlist"
        room.setUserlistView(self)
        tblUserlist.reloadData()
    }
    
    override func viewDidDisappear(animated: Bool) {
        room.setUserlistView(nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView:UITableView, commitEditingStyle editingStyle:UITableViewCellEditingStyle, forRowAtIndexPath indexPath:NSIndexPath) {
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return room.userlist.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "userlistCell")
            
            var user = room?.userlist.objectAtIndex(indexPath.row) as NSDictionary
            println(user["name"] as NSString)
            cell.textLabel?.text = user["name"] as NSString
            return cell
            
    }
    
    @IBAction func backBtnClicked(btn:UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}