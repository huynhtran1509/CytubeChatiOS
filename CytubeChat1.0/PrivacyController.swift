//
//  PrivacyController.swift
//  CytubeChat
//
//  Created by Erik Little on 10/25/14.
//

import UIKit

class PrivacyController: UIViewController {
    
    @IBOutlet weak var backBtn:UIBarButtonItem!
    @IBOutlet weak var webView:UIWebView!
    let privacyLink = NSURLRequest(URL: NSURL(string: "http://pastebin.com/raw.php?i=DtFfGReM")!)
    
    override func viewDidAppear(animated: Bool) {
        self.webView.loadRequest(privacyLink)
    }
    
    @IBAction func backBtnClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
