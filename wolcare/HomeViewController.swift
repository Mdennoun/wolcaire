//
//  HomeViewController.swift
//  wolcare
//
//  Created by Mohamed dennoun on 07/05/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    
  
    let requestServices: RequestService = RequestService()
    var requests:[Request]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        tabBar.barTintColor = UIColor(red: 38/255, green: 196/255, blue: 133/255, alpha: 1)
        self.navigationItem.setHidesBackButton(true, animated: true);
        setupTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
     func setupTabBar() {
        
        self.requestServices.getRequest { (requests) in
            print("ere")
            print(requests)
            print("ere")
           
            self.requests = requests
            let requestController = UINavigationController(rootViewController: RequestsCollectionViewController.newInstance(requests: requests))
            requestController.tabBarItem.image = UIImage(named: "help_senior_icon")
            requestController.tabBarItem.title = "Requetes"
            
            let workshopController = UINavigationController(rootViewController: createWorkShopViewController())
            workshopController.tabBarItem.image = UIImage(named: "group_work_icon")
            workshopController.tabBarItem.title = "Ateliers"
            
            self.viewControllers = [requestController, workshopController]
            
        }
        
        
        
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
