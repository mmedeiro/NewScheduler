//
//  Aluno.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 08/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import Foundation
import CoreData

class Aluno: NSManagedObject {

    @NSManaged var curso: String
    @NSManaged var materia: String
    @NSManaged var nome: String
    @NSManaged var semestre: NSNumber

}
