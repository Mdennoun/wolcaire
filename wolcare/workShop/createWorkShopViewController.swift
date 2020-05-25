//
//  createWorkShopViewController.swift
//  wolcare
//
//  Created by Arnaud Salomon on 12/05/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit

class createWorkShopViewController: UIViewController {
    
    @IBOutlet var workShopImg: UIImageView!
    @IBOutlet var titleTxt: UILabel!
    @IBOutlet var titleEdt: UITextField!
    @IBOutlet var dateBeginTxt: UILabel!
    @IBOutlet var dateBeginEdt: UITextField!
    @IBOutlet var HourBeginTxt: UILabel!
    @IBOutlet var houtBeginEdt: UITextField!
    @IBOutlet var hourEndTxt: UILabel!
    @IBOutlet var hourEndEdt: UITextField!
    @IBOutlet var descriptionTxt: UILabel!
    @IBOutlet var descriptionEdt: UITextField!
    
    private var dateBeginPicker: UIDatePicker?
    private var hourBeginPicker: UIDatePicker?
    private var hourEndPicker: UIDatePicker?
    
let workShopService: WorkShopService = WorkShopService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image: UIImage = UIImage(named: "workshop")!
        workShopImg = UIImageView(image: image)
        
       // self.view.addSubview(workShopImg!)
        
        //self.workShopImg.image = image
        navigationItem.title = "Nouvel Atelier"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWorkShop))
        
        dateBeginPicker = UIDatePicker()
        dateBeginPicker?.datePickerMode = .date
        
        hourBeginPicker = UIDatePicker()
        hourBeginPicker?.datePickerMode = .time
        
        hourEndPicker = UIDatePicker()
        hourEndPicker?.datePickerMode = .time
        
        dateBeginPicker?.addTarget(self, action:
            #selector(createWorkShopViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        hourBeginPicker?.addTarget(self, action:
        #selector(createWorkShopViewController.hourBeginChanged(datePicker:)), for: .valueChanged)
        
        hourEndPicker?.addTarget(self, action:
        #selector(createWorkShopViewController.hourEndingChanged(datePicker:)), for: .valueChanged)
        
        dateBeginEdt.inputView = dateBeginPicker
        hourEndEdt.inputView = hourEndPicker
        houtBeginEdt.inputView = hourBeginPicker
        
        navigationItem.title = "Nouvel Atelier"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(createWorkShopViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        dateBeginEdt.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func hourEndingChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        hourEndEdt.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func hourBeginChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        houtBeginEdt.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    
    @objc func addWorkShop() {
        
        
        /*
         let date = Date().debugDescription
         print(date)
         var dateString = "02-03-2017"
        var dateFormatter = DateFormatter()

        // This is important - we set our input date format to match our input string
        // if the format doesn't match you'll get nil from your string, so be careful
        dateFormatter.dateFormat = "dd-MM-yyyy"

        //`date(from:)` returns an optional so make sure you unwrap when using.
        var dateFromString: Date? = dateFormatter.date(from: dateString)
        
        print(dateFromString)*/
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let dateBegin = "\(dateBeginEdt.text!) \(houtBeginEdt.text!)"
        let datEnding =  "\(dateBeginEdt.text!) \(hourEndEdt.text!)"
        
        let begin = dateFormatter.date(from: dateBegin)!
        let end = dateFormatter.date(from: datEnding)!
        print(datEnding)
        print(end)
        
        guard let idCreator = self.titleTxt.text,
            let title = self.titleEdt.text,
              let beginAt: Date? = begin,
              let datEnd: Date? = end,
              let status: Int? = 0,
            let detail: String = self.descriptionEdt.text ?? "bug?",
              let category = self.titleEdt.text // a replacer par la roulette -> faire comme pour le selecteur de date ?
        
  // Probleme avec la date et API, API = date debut + fin ( heure incluse) et non date debut , heure fin , heure debut
              else {
                return
        }

        let workShop = WorkShop(_id: nil,idCreator: nil, idIntervenant: nil, title: title, workShopDescription: detail, dateAvailable: begin.debugDescription, datEnd: end.debugDescription, category: category, status: 0, createAt: nil)

        self.workShopService.neWorkShop(workShop: workShop) { (success) in
            print("\(success)")
        }

            self.navigationController?.pushViewController(HomeViewController(), animated: true)
       }
    

}
