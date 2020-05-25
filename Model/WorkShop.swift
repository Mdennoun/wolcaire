//
//  WorkShop.swift
//  wolcare
//
//  Created by Arnaud Salomon on 10/05/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import Foundation

class WorkShop: CustomStringConvertible {
 
    
    var idCreator: String?
    var idIntervenant: String?
    var title: String?
    var workShopDescription: String?
    var dateAvailable: String?
    var datEnd: String?
    var category: String?
    var _id: String?
    var status: Int?
    var createAt: Date?

    
    init(idCreator: String?, idIntervenant: String?, title: String?, workShopDescription: String?, dateAvailable: String?, datEnd: String?, category: String?, status: Int?, createAt: Date?) {
        
        
        self.idCreator = idCreator
        self.idIntervenant = idIntervenant
        self.title = title
        self.workShopDescription = workShopDescription
        self.dateAvailable = dateAvailable
        self.datEnd = datEnd
        self.category = category
        self.status = status
        
        
   
    } 
    
    
    convenience init(_id: String?,idCreator: String?, idIntervenant: String?, title: String?, workShopDescription: String?, dateAvailable: String?, datEnd: String?, category: String?, status: Int?, createAt: Date?) {
        self.init(idCreator: idCreator, idIntervenant: idIntervenant, title: title, workShopDescription: workShopDescription, dateAvailable: dateAvailable, datEnd: datEnd, category: category, status: status, createAt: createAt)
         self._id = _id
         self.idCreator = idCreator
         self.idIntervenant = idIntervenant
         self.title = title
         self.workShopDescription = workShopDescription
         self.dateAvailable = dateAvailable
         self.datEnd = datEnd
         self.category = category
         self.status = status
         self.createAt = createAt
         
    
     }
    
    var description: String {
    return "{ idCreator: \(self.idCreator ), idIntervenant: \(self.idIntervenant), title: \(self.title), description: \(self.workShopDescription), dateAvailable: \(self.dateAvailable), datEnd: \(self.datEnd), category: \(self.category), id: \(_id), createAt: \(self.createAt), status: \(self.status) }"
    }
}
