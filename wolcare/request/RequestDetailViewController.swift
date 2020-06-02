//
//  RequestDetailViewController.swift
//  wolcare
//
//  Created by Mohamed dennoun on 02/06/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit

class RequestDetailViewController: UIViewController {

    @IBOutlet var creatorPseudo: UILabel!
    @IBOutlet var creationDate: UILabel!
    @IBOutlet var requestDescription: UILabel!
    @IBOutlet var picture: UIImageView!
    
    
    class func newInstance(request: Request) -> RequestDetailViewController {
        
        let requestlvc = RequestDetailViewController()

        requestlvc.navigationItem.title = request.title!
            
        
        
        if let imageURL = URL(string: request.photoPath!) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        requestlvc.picture?.image = image
                        requestlvc.creatorPseudo?.text = request.idUser!
                        requestlvc.creationDate?.text = request.idUser!
                        requestlvc.requestDescription?.text = request.Requestdescription!
                    }
                }
                DispatchQueue.main.async {
                    if (requestlvc.picture.image == nil){
                        
                        requestlvc.picture?.image = UIImage(named: "workshop")
                        requestlvc.creatorPseudo?.text = request.psuedoUser!
                        requestlvc.creationDate?.text = request.createAt!
                        requestlvc.requestDescription?.text = request.Requestdescription!
                    }
                }
            }
        }
        return requestlvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
