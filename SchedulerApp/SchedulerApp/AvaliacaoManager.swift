//
//  AvaliacaoManager.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 09/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit
import CoreData

public class AvaliacaoManager {
    static let sharedInstance:AvaliacaoManager = AvaliacaoManager()
    static let entityName:String = "Avaliacao"
    lazy var managedContext:NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var c = appDelegate.managedObjectContext
        return c!
        }()
    
    private init(){}
    
    func novaAvaliacao() -> Avaliacao
    {
        return NSEntityDescription.insertNewObjectForEntityForName(AvaliacaoManager.entityName, inManagedObjectContext: managedContext) as! Avaliacao
    }
    
    func salvar ()
    {
        var error:NSError?
        managedContext.save(&error)
        
        if let e = error {
            println(("Could not save. Error: \(error), \(error!.userInfo)"))
        }
    }
    
    func buscarAvaliacao() -> Array<Avaliacao>
    {
        let fetchRequest = NSFetchRequest(entityName: AvaliacaoManager.entityName)
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [Avaliacao] {
            return results
        } else {
            println("Could not fetch. Error: \(error), \(error!.userInfo)")
        }
        
        NSFetchRequest(entityName: "FetchRequest")
        
        return Array <Avaliacao>()
    }
    
}
