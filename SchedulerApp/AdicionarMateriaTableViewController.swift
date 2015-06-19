//
//  AdicionarMateriaTableViewController.swift
//  SchedulerApp
//
//  Created by Guilherme on 18/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class AdicionarMateriaTableViewController: UITableViewController {
    
    var materia: Materia?

    @IBOutlet weak var textFieldNota: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textFieldNome: UITextField!
    
    var nome = String()
    var nota = String()
    var data = NSDate()
    var edit = false
    
    @IBAction func salvarAvaliacao(sender:AnyObject){
        
        var avaliacao: Avaliacao?
        
        if edit {
            avaliacao = AvaliacaoManager.sharedInstance.novaAvaliacao()
            avaliacao?.notaAvaliacao = textFieldNota.text
            avaliacao?.dataAvaliacao = datePicker.date
            avaliacao?.nomeAvaliacao = textFieldNome.text
            avaliacao?.pertenceMateria = materia!
            AvaliacaoManager.sharedInstance.salvar()
        }
        
        
        
        
        
        var app = UILocalNotification()
        var localNotification: UILocalNotification = UILocalNotification()
        var newDate = datePicker.date
        var calendar = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone.defaultTimeZone()
        
        for i in 1...7 {
            var daysToSbustract = NSDateComponents()
            daysToSbustract.day = 0 - i
            var aux = calendar.dateByAddingComponents(daysToSbustract, toDate: newDate, options: NSCalendarOptions(0))
            
            localNotification.fireDate = aux
            localNotification.timeZone = NSTimeZone.systemTimeZone()
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.alertBody = "\(avaliacao?.nomeAvaliacao) será em \(i) dias, CUIDADO!"
            localNotification.alertTitle = "Scheduler: "
            localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber+1
            
            localNotification.alertAction = "ver"
            
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        }
        
        self.navigationController?.popViewControllerAnimated(true)
      //  println("esta salvando\(AvaliacaoManager.sharedInstance.salvar())")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldNome.text = nome
        textFieldNota.text = nota
        datePicker.date = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let hView = view as! UITableViewHeaderFooterView
        hView.textLabel.textColor = UIColor.whiteColor()
    }
/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

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
