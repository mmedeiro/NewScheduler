//
//  MateriaViewController.swift
//  SchedulerApp
//
//  Created by Felipe Marques Ramos on 17/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class MateriaViewController: UIViewController {
    
    var materia: Materia?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = materia!.nomeMateria
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
