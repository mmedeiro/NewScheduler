//
//  CloudKitHelper.swift
//  SchedulerApp
//
//  Created by Guilherme on 22/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitHelper {
    var container : CKContainer
    var publicDB : CKDatabase
    let privateDB : CKDatabase
    
    init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    func pegaCloud() -> Bool{
        privateDB.performQuery(CKQuery(recordType: MateriaManager.entityName, predicate: NSPredicate(value: true)), inZoneWithID: nil) { (results: [AnyObject]!, error: NSError!) -> Void in
            
            var mats : [Materia] = []
            if error == nil{
                
                MateriaManager.sharedInstance.deletAll()
                
                
                for result in results as! [CKRecord]{
                    let newMateria = MateriaManager.sharedInstance.novaMateria()
                    newMateria.idCloud = result.recordID.recordName
                    newMateria.nomeMateria = result.objectForKey("nomeMateria") as! String
                    mats.append(newMateria)
                }
                MateriaManager.sharedInstance.salvar()
                
                
            }
            
            
            
            self.privateDB.performQuery(CKQuery(recordType: AvaliacaoManager.entityName, predicate: NSPredicate(value: true)), inZoneWithID: nil) { (results: [AnyObject]!, error: NSError!) -> Void in
                
                if error == nil{
                    AvaliacaoManager.sharedInstance.deletAll()
                    var disciplinas : [Avaliacao] = []
                    for result in results as! [CKRecord]{
                        let newTarefa = AvaliacaoManager.sharedInstance.novaAvaliacao()
                        
                        newTarefa.idCloud = result.recordID.recordName
                        newTarefa.nomeAvaliacao = result.objectForKey("nomeAvaliacao") as! String
                        newTarefa.dataAvaliacao = result.objectForKey("dataAvaliacao") as! NSDate
                        newTarefa.notaAvaliacao = result.objectForKey("notaAvaliacao") as! String
                        newTarefa.statusAvaliacao = result.objectForKey("statusAvaliacao") as! Bool
                        var Materia = result.objectForKey("pertenceMateria") as? String
                        for mat in mats{
                            if mat.nomeMateria == Materia{
                                newTarefa.pertenceMateria = mat
                            }
                        }
                        AvaliacaoManager.sharedInstance.salvar()
                    }
                    
                }
            }
            
        }
        return true
    }
    

        
    
}