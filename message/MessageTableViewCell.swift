//
//  MessageTableViewCell.swift
//  wolcare
//
//  Created by DENNOUN Mohamed on 29/06/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 5
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
         
        addSubview(messageLabel)
        //messageLabel.backgroundColor = .green
        messageLabel.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybee even a third.We want to provide a longer string that is actually going to wrap onto the next line and maybee even a third. "
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        
        // constraint for label
        let constraints = [messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 51),
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 51),
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -51),
        messageLabel.widthAnchor.constraint(equalToConstant: 400),
        
        bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -31),
        bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -31),
        bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 31),
        bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 31)]
        
        NSLayoutConstraint.activate(constraints)
//        messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
