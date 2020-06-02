//
//  WorkShopFactory.swift
//  wolcare
//
//  Created by Arnaud Salomon on 12/05/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import Foundation

class WorkShopFactory {
    
    static func workShopFrom(workShop: [String:Any]) -> WorkShop? {
        guard let id = workShop["_id"] as? String,
            let idIntervenant = workShop["idIntervenant"] as? String,
            let workShopDescription = workShop["description"] as? String,
            let title = workShop["title"] as? String,
            let category = workShop["idCategory"] as? String,
            let createAt = workShop["createAt"] as? Date,
            let status = workShop["status"] as? Int,
            let idCreator = workShop["idCreator"] as? String,
            let dateAvailable = workShop["dateAvailable"] as? String,
            let datEnd = workShop["datEnd"] as? String else {
                return nil
        }
        
        
        
        return WorkShop(_id: id,idCreator: idCreator, idIntervenant: idIntervenant, title: title, workShopDescription: workShopDescription, dateAvailable: dateAvailable, datEnd: datEnd, category: category, status: status, createAt: createAt)
    }
    
   
    static func dictionaryFrom(workShop: WorkShop) -> [String: Any] {
        return [
            "idCreator": workShop.idCreator ?? nil,
            "idIntervenant": workShop.idIntervenant ?? nil,
            "description": workShop.workShopDescription ?? "defaultdescription",
            "title": workShop.title ?? "default_Title",
            "category": workShop.category,
            "dateAvailable": workShop.dateAvailable,
            "datEnd": workShop.datEnd ,
            "status": workShop.status ?? 0,
            
            

        ]
    }

}
