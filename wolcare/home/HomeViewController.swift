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
    let workshopServices: WorkShopService = WorkShopService()
    var requests:[Request]?
    var workshops:[WorkShop]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        tabBar.barTintColor = UIColor(red: 38/255, green: 196/255, blue: 133/255, alpha: 1)
        self.navigationItem.setHidesBackButton(true, animated: true);
        setupTabBar()
        self.workshopServices.getWorkshop { (workshops) in
            print(workshops)
            self.workshops = workshops
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
     func setupTabBar() {
        
        self.requestServices.getRequest { (requests) in
            print("ere")
           // print(requests)
            print("ere")
           
            self.requests = requests
            let requestController = UINavigationController(rootViewController:
                RequestsCollectionViewController.newInstance(requests: requests))
            requestController.tabBarItem.image = UIImage(named: "help_senior_icon")
            requestController.tabBarItem.title = "Requetes"
            
         
           
        self.workshopServices.getWorkshop { (workshops) in
            print("eworkji")
            print(workshops)
            print("ere")
            
           
            
            let workshopController = UINavigationController(rootViewController: WorkshopCollectionViewController.newInstance(workshops: self.workshops!))
            workshopController.tabBarItem.image = UIImage(named: "group_work_icon")
            workshopController.tabBarItem.title = "Ateliers"
            let profileController = UINavigationController(rootViewController: ProfileViewController())
            profileController.tabBarItem.image = UIImage(named: "group_work_icon")
            profileController.tabBarItem.title = "Profile"
            self.viewControllers = [requestController, workshopController, profileController]
        }
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
