//
//  Avaliacao.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 08/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import Foundation
import CoreData

class Avaliacao: NSManagedObject {

    @NSManaged var dataAvaliacao: NSDate
    @NSManaged var horarioAvaliacao: AnyObject
    @NSManaged var notaAvaliacao: NSNumber
    @NSManaged var pesoAvaliacao: NSNumber
    @NSManaged var tipoAvaliacao: String

}
