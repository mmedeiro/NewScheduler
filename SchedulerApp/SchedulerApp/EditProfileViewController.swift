//
//  EditProfileViewController.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 08/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit
import MobileCoreServices

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var ProfileImage: UIImageView!
    @IBOutlet weak var StudentNameTextField: UITextField!
    @IBOutlet weak var StudentCourseTextField: UITextField!
    @IBOutlet weak var StudentPeriodTextField: UITextField!
    
    let img = UIImagePickerController()
    
    @IBAction func changeImageButton(sender: UIButton) {
        
            img.allowsEditing = false
            img.sourceType = .PhotoLibrary
            
            presentViewController(img, animated: true, completion: nil)
    }
    
    
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
        
        img.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        StudentNameTextField.resignFirstResponder()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ProfileImage.contentMode = .ScaleAspectFit
            ProfileImage.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
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
