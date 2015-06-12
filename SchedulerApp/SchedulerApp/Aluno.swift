//
//  Aluno.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 12/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import Foundation
import CoreData

@objc(Aluno)
class Aluno: NSManagedObject {

    @NSManaged var curso: String
    @NSManaged var nome: String
    @NSManaged var semestre: NSNumber
    @NSManaged var possuiMateria: NSSet
    
    func addMateria (materia: Materia) {
        var possuiMateria = self.mutableSetValueForKey("possuiMateria")
        possuiMateria.addObject(materia)
    }
    
    func deleteMateria (materia: Materia) {
        var possuiMateria = self.mutableSetValueForKey("possuiMateria")
        possuiMateria.removeObject(materia)
    }


}
