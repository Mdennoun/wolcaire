//
//  MessageTableViewController.swift
//  wolcare
//
//  Created by DENNOUN Mohamed on 29/06/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
    
    func reduceToMonthDayYear() -> Date {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        let year = calendar.component(.year, from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: "\(month)/\(day)/\(year)") ?? Date()
    }
}
class MessageTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
  
 


   
    
        let tableView : UITableView = {
             let t = UITableView()
             t.translatesAutoresizingMaskIntoConstraints = false
             return t
         }()
    
    
 

    
    
        fileprivate let cellId = "id123"

            let messagesFromServer = [
                ChatMessage(text: "Here's my very first message", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
                ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
                ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "09/15/2018")),
                ChatMessage(text: "Yo, dawg, Whaddup!", isIncoming: false, date: Date()),
                ChatMessage(text: "This message should appear on the left with a white background bubble", isIncoming: true, date: Date.dateFromCustomString(customString: "09/15/2018")),
                ChatMessage(text: "Third Section message", isIncoming: true, date: Date.dateFromCustomString(customString: "10/31/2018"))
            ]
            
            fileprivate func attemptToAssembleGroupedMessages() {
                print("Attempt to group our messages together based on Date property")
                
                let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
                    return element.date.reduceToMonthDayYear()
                }
                
                // provide a sorting for your keys somehow
                let sortedKeys = groupedMessages.keys.sorted()
                sortedKeys.forEach { (key) in
                    let values = groupedMessages[key]
                    chatMessages.append(values ?? [])
                }
                
            }
            
            var chatMessages = [[ChatMessage]]()
    var keyboardHeight = 0
    var textView : UITextView!

    
            override func viewDidLoad() {
                super.viewDidLoad()
                
                attemptToAssembleGroupedMessages()
                
                navigationItem.title = "Messages"
                navigationController?.navigationBar.prefersLargeTitles = true
                textView = UITextView ( frame: CGRect(x: 0, y: view.frame.height - 35, width: view.frame.width - 50, height: 35))
                tableView.translatesAutoresizingMaskIntoConstraints = false
                tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: cellId)
                tableView.separatorStyle = .none
                tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
                self.view.backgroundColor = UIColor.blue


               
                  // add the table view to self.view
                  self.view.addSubview(tableView)
                  tableView.translatesAutoresizingMaskIntoConstraints = false
                
                tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
                tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
                tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
                
               
                self.automaticallyAdjustsScrollViewInsets = false
                
                //textView.center = self.view.center
                textView.textAlignment = NSTextAlignment.justified
                textView.backgroundColor = UIColor.lightGray
                
                // Utiliser la couleur RVB
                textView.backgroundColor = UIColor(red: 39 / 255, green: 53 / 255, blue: 182 / 255, alpha: 1)

                textView.becomeFirstResponder()
                
                // Mettre à jour la taille et la couleur de la police UITextView
                textView.font = UIFont.systemFont ( ofSize: 20 )
                textView.textColor = UIColor.white
                
                textView.font = UIFont.boldSystemFont ( ofSize: 20 )
                textView.font = UIFont( name: "Verdana" , size: 17 )
                
                // Mettre en majuscule tous les types d'utilisateurs de caractères
                textView.autocapitalizationType = UITextAutocapitalizationType.allCharacters
                
                // Rendre les liens Web UITextView cliquables
                textView.isSelectable = true
                textView.isEditable = false
                textView.dataDetectorTypes = UIDataDetectorTypes.link
                
                // Rendre les coins UITextView arrondis
                //textView.layer.cornerRadius = 10
                
                // Activer la correction automatique et la vérification orthographique
                textView.autocorrectionType = UITextAutocorrectionType.yes
                textView.spellCheckingType = UITextSpellCheckingType.yes
                // myTextView.autocapitalizationType = UITextAutocapitalizationType.None
                
                // Rendre UITextView modifiable
                textView.isEditable = true
                
                self.view.addSubview ( textView )
              
                
                    
                
                
                  // set delegate and datasource
                  tableView.delegate = self
                  tableView.dataSource = self
                textView.delegate = self
                

            }
    
  

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self,
        selector: #selector(keyboardWillShow),
        name: UIResponder.keyboardWillShowNotification, object: nil)
       
        
    }
    var isKeyBoardHide = true
    @objc func keyboardWillShow(notification: NSNotification) {

        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if let userInfo = notification.userInfo, let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRect = keyboardFrameValue.cgRectValue
                // keyboardRect.height gives the height of the keyboard
                // your additional code here...

                self.keyboardHeight = Int(keyboardRect.height)
            }
            
            print("keyboardHeight : \(keyboardHeight)")
           
            
            
            
            
            
            }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        
        moveTextView(textView, moveDistance: -keyboardHeight, up: true)
    }

    // Finish Editing The Text Field
    func textViewDidEndEditing(_ textView: UITextView) {
        print("here test : \(keyboardHeight)")
        moveTextView(textView, moveDistance: +keyboardHeight, up: false)
        
    }

    
    

   
       // Hide the keyboard when the return key pressed
       func textViewShouldReturn(_ textView: UITextView) -> Bool {
           textView.resignFirstResponder()
           return true
       }
       

       // Move the text field in a pretty animation!
       func moveTextView(_ textView: UITextView, moveDistance: Int, up: Bool) {
           let moveDuration = 0.3
           let movement: CGFloat = CGFloat(up ? moveDistance : moveDistance)

           UIView.setAnimationsEnabled(true)
           UIView.animate(withDuration: moveDuration) {
               self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
               
           }
         
       }
     
      

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return chatMessages.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chatMessages[section].count
    }
            
            class DateHeaderLabel: UILabel {
                
                override init(frame: CGRect) {
                    super.init(frame: frame)
                    
                    backgroundColor = .black
                    textColor = .white
                    textAlignment = .center
                    translatesAutoresizingMaskIntoConstraints = false // enables auto layout
                    font = UIFont.boldSystemFont(ofSize: 14)
                }
                
                required init?(coder aDecoder: NSCoder) {
                    fatalError("init(coder:) has not been implemented")
                }
                
                override var intrinsicContentSize: CGSize {
                    let originalContentSize = super.intrinsicContentSize
                    let height = originalContentSize.height + 12
                    layer.cornerRadius = height / 2
                    layer.masksToBounds = true
                    return CGSize(width: originalContentSize.width + 20, height: height)
                }
                
            }
            
             func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                if let firstMessageInSection = chatMessages[section].first {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    let dateString = dateFormatter.string(from: firstMessageInSection.date)
                    
                    let label = DateHeaderLabel()
                    label.text = dateString
                    
                    let containerView = UIView()
                    
                    containerView.addSubview(label)
                    label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
                    label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
                    
                    return containerView
                    
                }
                return nil
            }
            
             func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return 50
            }
    
            
             func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessageTableViewCell
        //        let chatMessage = chatMessages[indexPath.row]
                let chatMessage = chatMessages[indexPath.section][indexPath.row]
                cell.chatMessage = chatMessage
                return cell
            }


}

