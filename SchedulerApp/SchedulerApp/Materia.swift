//
//  Materia.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 12/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import Foundation
import CoreData

@objc(Materia)
class Materia: NSManagedObject {

    @NSManaged var nomeMateria: String
    @NSManaged var pertenceAluno: Aluno
    @NSManaged var possuiAvaliacao: NSSet

    func addAvaliacao (avaliacao: Avaliacao) {
        var possuiAvaliacao = self.mutableSetValueForKey("possuiAvaliacao")
        possuiAvaliacao.addObject(avaliacao)
    }
    
    func deleteAvaliacao (avaliacao: Avaliacao) {
        var possuiAvaliacao = self.mutableSetValueForKey("possuiAvaliacao")
        possuiAvaliacao.removeObject(avaliacao)
    }
}
