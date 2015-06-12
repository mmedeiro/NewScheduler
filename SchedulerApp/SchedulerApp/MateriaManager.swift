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

public class MateriaManager {
    static let sharedInstance = MateriaManager()
    static let entityName:String = "Materia"
    
    let CoreData = CoreDataManager.sharedInstance
    //
    //    lazy var managedContext:NSManagedObjectContext = {
    //        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //        var c = appDelegate.managedObjectContext
    //        return c!
    //        }()
    //
    private init(){}
    
    func novaMateria() -> SchedulerApp.Materia {
        
        return NSEntityDescription.insertNewObjectForEntityForName(MateriaManager.entityName, inManagedObjectContext: CoreData.managedObjectContext!) as! SchedulerApp.Materia
    }
    
    func Materia() -> Array<SchedulerApp.Materia>? {
        return CoreData.fetchData(MateriaManager.entityName, predicate: NSPredicate(format: "TRUEPREDICATE")) as? Array<SchedulerApp.Materia>
    }
    
    func Materia(predricate: NSPredicate) -> Array<SchedulerApp.Materia>? {
        return CoreData.fetchData(MateriaManager.entityName, predicate: predricate) as? Array<SchedulerApp.Materia>
    }
    
    func salvar ()
    {
        CoreData.saveContext()
    }
    
    func delete(Materia: SchedulerApp.Materia) {
        CoreData.managedObjectContext?.deleteObject(Materia)
    }
    
    func deletAll() {
        let allObjects: Array<SchedulerApp.Materia> = self.Materia()!
        for item: SchedulerApp.Materia in allObjects as Array<SchedulerApp.Materia> {
            self.delete(item)
        }
}
}