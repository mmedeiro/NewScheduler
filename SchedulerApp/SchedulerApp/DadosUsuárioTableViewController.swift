//
//  DadosUsuárioTableViewController.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 13/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreData

class DadosUsua_rioTableViewController: UITableViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    var nome: String?
    var curso: String?
    var semestre: String?
    
    @IBOutlet weak var nomeUsuarioTextField: UITextField!
    @IBOutlet weak var cursoUsuarioTextField: UITextField!
    @IBOutlet weak var semestreUsuarioTextField: UITextField!
    
    @IBOutlet weak var botaoSalvarDadosUsuario: UIButton!
    
    @IBAction func botaoSalvarDadosUsuario(sender: AnyObject) {
        
        var aluno = AlunoManager.sharedInstance.novoAluno()
        aluno.nome = nomeUsuarioTextField.text
        aluno.curso = cursoUsuarioTextField.text
        aluno.semestre = (semestreUsuarioTextField.text).toInt()!
        
        AlunoManager.sharedInstance.salvar()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ntc = NSNotificationCenter.defaultCenter()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
        nomeUsuarioTextField.placeholder = "Nome do aluno"
        cursoUsuarioTextField.placeholder = "Curso"
        semestreUsuarioTextField.placeholder = "Semestre Atual"
        if nome != nil{
            nomeUsuarioTextField.text = nome
            cursoUsuarioTextField.text = curso
            semestreUsuarioTextField.text = semestre
        }
        if semestreUsuarioTextField.text != nil {
            if semestreUsuarioTextField.text.lowercaseString.rangeOfString("semestre") != nil{
                semestreUsuarioTextField.text = semestreUsuarioTextField.text[0]
            }
        }
        else{
            semestreUsuarioTextField.text = "0"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
extension String {
    
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
}