//
//  RequestCreateViewController.swift
//  wolcare
//
//  Created by Mohamed dennoun on 03/06/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit
import Alamofire

class WorkshopCreateViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var libraryButton: UIButton!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var titleRequest: UITextField!
    @IBOutlet var requestDescription: UITextField!
    @IBOutlet var spener: UIActivityIndicatorView!
    
    let workshopServices: WorkShopService = WorkShopService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Nouvel Atelier"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(validateTapped))
        
        navigationController?.title = "Nouvel Atelier"
        
       
        
        
    }
    @objc func validateTapped() {
        
        print("save")
        mainImageView.isHidden = true
        requestDescription.isHidden = true
        titleRequest.isHidden = true
        cameraButton.isHidden = true
        libraryButton.isHidden = true
        self.spener.isHidden = false
        spener.startAnimating()
        
        var workshop = WorkShop(idCategory: "5e48048059ac860004ce7dfe", idCreator: connecterUser.id, idIntervenant: "5e48048059ac860004ce7dfe", title: titleRequest.text, maxPeoplesAllowed: 10, status: 0, dateAvailable: "2020-07-06T11:28:08.847Z", createAt: "2020-07-06T11:28:08.847Z", datEnd: "2020-08-06T11:28:08.847Z", photoPath: "photoPath", WorkshopDescription: requestDescription.text)
        
        print(mainImageView.image?.pngData())
        Post(image : mainImageView.image, workshop: workshop)
        
    }
    // MARK: IBAction Methods
    
    @IBAction func camera(sender: Any?) {
        presentUIImagePicker(sourceType: .camera)
    }
    
    @IBAction func library(sender: Any?) {
        presentUIImagePicker(sourceType: .photoLibrary)
    }
    
    // MARK: Helper Methods

    private func presentUIImagePicker(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true, completion: nil)
    }
}

// MARK: UIImagePickerControllerDelegate and UINavigationControllerDelegate

extension WorkshopCreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        guard let chosenImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage else {
            dismiss(animated: true, completion: nil)
            
            return
        }
        mainImageView.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    func Post(image : UIImage?, workshop: WorkShop){
        print(workshop)
        let parameters = WorkShopFactory.dictionaryFrom(workShop: workshop)

        let headers: HTTPHeaders = [
            /* "Authorization": "your_access_token",  in case you need authorization header */
            "Content-type": "application/json"
        ]
        
        


            AF.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(image!.jpegData(compressionQuality: 0.3)!, withName: "photo" , fileName: "file.jpeg", mimeType: "image/jpeg")
                    for (key, value) in parameters {
                        if let temp = value as? String {
                            multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                        }
                    }
            },
                to: "http://localhost:7000/api/addNewWorkshop", method: .post , headers: headers)
                .response { resp in
                    print("here")
                    print(resp.debugDescription)
                    print(resp.data)
                    
                    self.workshopServices.getWorkShop { (workshops) in

                    self.mainImageView.isHidden = false
                    self.requestDescription.isHidden = false
                    self.titleRequest.isHidden = false
                    self.cameraButton.isHidden = false
                    self.libraryButton.isHidden = false
                    self.spener.isHidden = true
                    self.spener.stopAnimating()
                        let workshopController = WorkshopCollectionViewController.newInstance(workshops: workshops)
                        
                        self.navigationController?.pushViewController(workshopController, animated: true)
                        
                        print(resp)
                        
                    }

            }
    }
   
}
