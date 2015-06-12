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

public class AlunoManager {
    static let sharedInstance = AlunoManager()
    static let entityName:String = "Aluno"
    
    let CoreData = CoreDataManager.sharedInstance
    //
    //    lazy var managedContext:NSManagedObjectContext = {
    //        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //        var c = appDelegate.managedObjectContext
    //        return c!
    //        }()
    //
    private init(){}
    
    func novoAluno() -> SchedulerApp.Aluno {
        
        return NSEntityDescription.insertNewObjectForEntityForName(AlunoManager.entityName, inManagedObjectContext: CoreData.managedObjectContext!) as! SchedulerApp.Aluno
    }
    
    func Aluno() -> Array<SchedulerApp.Aluno>? {
        return CoreData.fetchData(AlunoManager.entityName, predicate: NSPredicate(format: "TRUEPREDICATE")) as? Array<SchedulerApp.Aluno>
    }
    
    func Aluno(predricate: NSPredicate) -> Array<SchedulerApp.Aluno>? {
        return CoreData.fetchData(AlunoManager.entityName, predicate: predricate) as? Array<SchedulerApp.Aluno>
    }
    
    func salvar ()
    {
        CoreData.saveContext()
    }
    
    func delete(Aluno: SchedulerApp.Aluno) {
        CoreData.managedObjectContext?.deleteObject(Aluno)
    }
    
    func deletAll() {
        let allObjects: Array<SchedulerApp.Aluno> = self.Aluno()!
        for item: SchedulerApp.Aluno in allObjects as Array<SchedulerApp.Aluno> {
            self.delete(item)
        }
}
}