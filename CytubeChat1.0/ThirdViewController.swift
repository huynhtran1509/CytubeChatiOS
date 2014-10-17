//
//  ThirdViewController.swift
//  CytubeChat1.0
//
//  Created by Erik Little on 10/13/14.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var roomTitle:UINavigationItem!
    @IBOutlet var messageView:UITableView!
    @IBOutlet var chatInput:UITextField!
    let tapRec = UITapGestureRecognizer()
    weak var room:CytubeRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        room = roomMng.getActiveRoom()
        room?.setChatWindow(self)
        roomTitle.title = room?.roomName
        tapRec.addTarget(self, action: "tappedMessages")
        messageView.addGestureRecognizer(tapRec)
        messageView.reloadData()
        //        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
        //        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let r:CytubeRoom = room? {
            var c = room?.messageBuffer.count
            return c!
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        
        let c:Int = indexPath.row
        let d:Int32 = Int32(c)
        // println(room?.messageBuffer.objectAtIndex(1))
        cell.textLabel?.text = room?.messageBuffer.objectAtIndex(c) as NSString
 
        return cell
    }
    
    //    func keyboardWillShow(sender: NSNotification) {
    //        self.view.frame.origin.y -= posOfChatInput
    //    }
    //
    //    func keyboardWillHide(sender: NSNotification) {
    //        self.view.frame.origin.y += posOfChatInput
    //    }
    
    // Hide keyboard if we touch anywhere
    func tappedMessages() {
        self.view.endEditing(true)
        messageView.reloadData()
    }
    
    override func touchesBegan(touches:NSSet, withEvent event:UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool {
        println("got enter")
        textField.resignFirstResponder()
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnClicked(btn:UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func shouldSendMessage(btn:UIBarButtonItem) {
        println("Should send message")
    }
}