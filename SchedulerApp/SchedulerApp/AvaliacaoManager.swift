//
//  AvaliacaoManager.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 09/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit
import CoreData
import Foundation

public class AvaliacaoManager {
    static let sharedInstance = AvaliacaoManager()
    static let entityName:String = "Avaliacao"
    
    let CoreData = CoreDataManager.sharedInstance
//    
//    lazy var managedContext:NSManagedObjectContext = {
//        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        var c = appDelegate.managedObjectContext
//        return c!
//        }()
//    
    private init(){}
    
    func novaAvaliacao() -> SchedulerApp.Avaliacao {
        
        return NSEntityDescription.insertNewObjectForEntityForName(AvaliacaoManager.entityName, inManagedObjectContext: CoreData.managedObjectContext!) as! SchedulerApp.Avaliacao
    }
    
    func Avaliacao() -> Array<SchedulerApp.Avaliacao>? {
        return CoreData.fetchData(AvaliacaoManager.entityName, predicate: NSPredicate(format: "TRUEPREDICATE")) as? Array<SchedulerApp.Avaliacao>
    }
    
    func Avaliacao(predricate: NSPredicate) -> Array<SchedulerApp.Avaliacao>? {
        return CoreData.fetchData(AvaliacaoManager.entityName, predicate: predricate) as? Array<SchedulerApp.Avaliacao>
    }
    
    func salvar ()
    {
       CoreData.saveContext()
    }
    
    func delete(Avaliacao: SchedulerApp.Avaliacao) {
        CoreData.managedObjectContext?.deleteObject(Avaliacao)
    }
    
    func deletAll() {
        let allObjects: Array<SchedulerApp.Avaliacao> = self.Avaliacao()!
        for item: SchedulerApp.Avaliacao in allObjects as Array<SchedulerApp.Avaliacao> {
            self.delete(item)
        }
    }
//    func buscarAvaliacao() -> Array<Avaliacao>
//    {
//        let fetchRequest = NSFetchRequest(entityName: AvaliacaoManager.entityName)
//        var error: NSError?
//        
//        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
//        
//        if let results = fetchedResults as? [Avaliacao] {
//            return results
//        } else {
//            println("Could not fetch. Error: \(error), \(error!.userInfo)")
//        }
//        
//        NSFetchRequest(entityName: "FetchRequest")
//        
//        return Array <Avaliacao>()
//    }
    
}

