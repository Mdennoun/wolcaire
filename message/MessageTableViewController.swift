//
//  MessageTableViewController.swift
//  wolcare
//
//  Created by DENNOUN Mohamed on 29/06/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit

class MessageTableViewController: UITableViewController {

    fileprivate let cellId = "id1415"
    let textMessages = [
        "Here's my first message",
        "I'm here going to message another long message that will word wrap",
        "I'm here going to message another long message that will word wrap, I'm here going to message another long message that will word wrap,I'm here going to message another long message that will word wrap"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textMessages.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath ) as! MessageTableViewCell
//         cell.textLabel?.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybee even a third.We want to provide a longer string that is actually going to wrap onto the next line and maybee even a third. "
//        cell.textLabel?.numberOfLines = 0
        cell.messageLabel.text = textMessages[indexPath.row]
        return cell
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
