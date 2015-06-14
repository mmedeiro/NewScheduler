//
//  testeSalvarMateria.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 13/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class testeSalvarMateria: UIViewController {

    @IBOutlet weak var labelMateria: UILabel!
    
    var materias: Array<Materia>?
    var materia: Materia?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        materias = MateriaManager.sharedInstance.Materia()
        if materias?.count != 0 {
            
            materia = materias?.last
            
            if let m = materia {
              
                labelMateria.text = materia?.nomeMateria
                
            }
        }
        
        
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
