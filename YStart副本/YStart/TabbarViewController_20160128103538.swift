//
//  TabViewController.swift
//  ySeed
//
//  Created by ykq on 15/8/17.
//  Copyright (c) 2015年 ykq. All rights reserved.
//


import UIKit


class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let HomeVC = HomeViewController();
        let CategoryVC = CategoryViewController();
        
        let DiscoverVC = DiscoverViewController();
        let MyVC = MyViewController();

        
        
        let homeNav = renderTabbar(HomeVC, title: "首页", image: "tabbar_home", selectedImage: "tabbar_home_highlighted");
        let categoryNav = renderTabbar(CategoryVC, title: "消息", image: "tabbar_message_center", selectedImage: "tabbar_message_center_highlighted");
        
        let discoverNav = renderTabbar(DiscoverVC, title: "发现", image: "tabbar_discover", selectedImage: "tabbar_discover_highlighted");
        let myNav = renderTabbar(MyVC, title: "我", image: "tabbar_profile", selectedImage: "tabbar_profile_highlighted");
        
        //
        self.addChildViewController(homeNav)
        self.addChildViewController(categoryNav)
        self.addChildViewController(discoverNav)
        self.addChildViewController(myNav)
        
       
        
        
        
        //self.setupCenterButton();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    private func setupCenterButton() {
        self.addChildViewController(UIViewController());
        
        let centerBtn = UIButton(type: UIButtonType.Custom)
        tabBar.addSubview(centerBtn)
        centerBtn.backgroundColor = UIColor.redColor();

        centerBtn.frame = CGRectInset(tabBar.bounds, 2 * tabBar.bounds.width / CGFloat(childViewControllers.count) - 1, 1)  //居中
        centerBtn.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    func click(){
        print("click");
    }
    
    // tabbarcontroller 封装
    func renderTabbar(v:UIViewController,title:String,image:String,selectedImage:String)->UINavigationController{
        v.title = title;
        v.tabBarItem.image = UIImage(named:image);
        v.tabBarItem.selectedImage = UIImage(named: selectedImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        let selectedText = NSMutableDictionary();
        selectedText[NSForegroundColorAttributeName] = UIColor.orangeColor();
        v.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.grayColor()], forState: UIControlState.Normal);   //文字颜色
        
        //每个tabbar返回一个navigationcontroller
        let nav = UINavigationController(rootViewController: v);
        return nav;
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

