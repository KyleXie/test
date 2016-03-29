//
//  HomeViewController.swift
//  YStart
//
//  Created by ykq on 16/1/28.
//  Copyright © 2016年 ykq. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("test");
        let cookie = NSHTTPCookie(properties: [
            NSHTTPCookieName:"username",
            NSHTTPCookieValue:"test",
            NSHTTPCookiePath:"/",
            NSHTTPCookieDomain:"http://api.wtweika.com/test"
            ]);
        
        // 之前在这里打印 NSHTTPCookieStorage.sharedHTTPCookieStorage().cookieAcceptPolicy.rawValue，值是 2，
        // OnlyFromMainDocumentDomain, 在这里加一句，改成 Always 试试？
        NSHTTPCookieStorage.sharedHTTPCookieStorage().cookieAcceptPolicy = .Always
        
        NSHTTPCookieStorage.sharedHTTPCookieStorage().setCookies([cookie!], forURL: NSURL(string: "http://api.wtweika.com/test")!, mainDocumentURL: nil)
        
        let nsurl = NSURL(string: "http://api.wtweika.com/test");
        let request = NSMutableURLRequest(URL: nsurl!);
        let webview = UIWebView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT));
        webview.loadRequest(request);
        
        self.view.addSubview(webview);
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
