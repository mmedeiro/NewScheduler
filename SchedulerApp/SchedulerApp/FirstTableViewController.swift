//
//  FirstTableViewController.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 14/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController, UINavigationBarDelegate {

    @IBOutlet weak var nomeAlunoLabel: UILabel!
    @IBOutlet weak var cursoAlunoLabel: UILabel!
    @IBOutlet weak var semestreAlunoLabel: UILabel!
    
    var students: Array<Aluno>?
    var student: Aluno?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        students = AlunoManager.sharedInstance.Aluno()
        if students?.count != 0 {
            student = students?.last
            if let s = student {
                nomeAlunoLabel.text = s.nome
                cursoAlunoLabel.text = s.curso
                semestreAlunoLabel.text = "\(s.semestre) semestre"
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let hView = view as! UITableViewHeaderFooterView
        hView.textLabel.textColor = UIColor.whiteColor()
    }


//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("Prox", forIndexPath: indexPath) as! UITableViewCell
//
//        if indexPath.section == 2 {
//            cell.textLabel?.text = "COisa"
//        }
//
//        return cell
//    }


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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var dest = segue.destinationViewController as! DadosUsua_rioTableViewController
        dest.nome = nomeAlunoLabel.text
        dest.curso = cursoAlunoLabel.text
        if semestreAlunoLabel.text != "Semestre"{
            dest.semestre = semestreAlunoLabel.text
        }
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

}
