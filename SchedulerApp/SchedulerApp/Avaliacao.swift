//
//  Avaliacao.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 12/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import Foundation
import CoreData

@objc(Avaliacao)
class Avaliacao: NSManagedObject {

    @NSManaged var dataAvaliacao: NSDate
    @NSManaged var notaAvaliacao: NSNumber
    @NSManaged var pesoAvaliacao: NSNumber
    @NSManaged var tipoAvaliacao: String
    @NSManaged var pertenceMateria: Materia

}
