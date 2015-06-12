//
//  AlunosManager.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 09/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit
import CoreData

public class AlunoManager {
    static let sharedInstance:AlunoManager = AlunoManager()
    static let entityName:String = "Aluno"
    lazy var managedContext:NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var c = appDelegate.managedObjectContext
        return c!
        }()
    
    private init(){}
    
    func novoAluno()->Aluno
    {
        return NSEntityDescription.insertNewObjectForEntityForName(AlunoManager.entityName, inManagedObjectContext: managedContext) as! Aluno
    }
    
    func salvar ()
    {
        var error:NSError?
        managedContext.save(&error)
        
        if let e = error {
            println(("Could not save. Error: \(error), \(error!.userInfo)"))
        }
    }
    
    func buscarAluno() -> Array<Aluno>
    {
        let fetchRequest = NSFetchRequest(entityName: AlunoManager.entityName)
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [Aluno] {
            return results
        } else {
            println("Could not fetch. Error: \(error), \(error!.userInfo)")
        }
        
        NSFetchRequest(entityName: "FetchRequest")
        
        return Array <Aluno>()
    }
    
}
