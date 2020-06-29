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
        guard //let id = workShop["_id"] as? String,
            let idCategory = workShop["idCategory"] as? String,
            let idCreator = workShop["idCreator"] as? String,
            let idIntervenant = workShop["idIntervenant"] as? String,
            let title = workShop["title"] as? String,
            let maxPeoplesAllowed = workShop["maxPeoplesAllowed"] as? Int,
            let status = workShop["status"] as? Int,
            let dateAvailable = workShop["dateAvailable"] as? String,
            let datEnd = workShop["datEnd"] as? String,
            let createAt = workShop["createAt"] as? String,
            let photoPath = workShop["photoPath"] as? String,
            let WorkshopDescription = workShop["description"] as? String else {
                return nil
        }
        
        
        
        return WorkShop(idCategory: idCategory, idCreator: idCreator, idIntervenant: idIntervenant, title : title, maxPeoplesAllowed: maxPeoplesAllowed, status: status, dateAvailable: dateAvailable, createAt: createAt , datEnd: datEnd, photoPath: photoPath, WorkshopDescription: WorkshopDescription)
    }
    
   
    static func dictionaryFrom(workShop: WorkShop) -> [String: Any] {
        return [
            "idCategory": workShop.idCategory,
            "idCreator": workShop.idCreator,
            "idIntervenant": workShop.idIntervenant,
            "_id": workShop._id ?? nil,
            "idIntervenant": workShop.idIntervenant,
            "title": workShop.title ?? nil,
            "maxPeoplesAllowed": workShop.maxPeoplesAllowed,
            "status": workShop.status ?? 0,
            "dateAvailable": workShop.dateAvailable ,
            "datEnd": workShop.datEnd,
            "createAt": workShop.createAt,
            "photoPath": workShop.photoPath,
            "description": workShop.WorkshopDescription
            

        ]
    }

}
