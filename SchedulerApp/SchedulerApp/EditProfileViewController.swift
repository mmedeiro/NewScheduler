//
//  EditProfileViewController.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 08/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var StudentNameTextField: UITextField!
    @IBOutlet weak var StudentCourseTextField: UITextField!
    @IBOutlet weak var StudentPeriodTextField: UITextField!
    
    @IBAction func SaveProfileButton(sender: AnyObject) {
        //salvar as informacoes inseridas pelo usuario e mostrar na view principal
        
    }
    

    @IBAction func CancelEditProfileButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        StudentNameTextField.placeholder = "Nome do Aluno"
        StudentCourseTextField.placeholder = "Curso"
        StudentPeriodTextField.placeholder = "Semestre atual"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        StudentNameTextField.resignFirstResponder()
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
