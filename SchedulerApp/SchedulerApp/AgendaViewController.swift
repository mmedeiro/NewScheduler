//
//  AgendaViewController.swift
//  Scheduler
//
//  Created by Felipe Marques Ramos on 09/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var calendario: calendarioView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var tdsAvaliacoes: Array<Avaliacao>?
    var avaliacoes = Array<Avaliacao>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var soDiahj = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: NSDate())
        
        tdsAvaliacoes = AvaliacaoManager.sharedInstance.Avaliacao()!
        for avalacao in tdsAvaliacoes!{
            
            var soDia = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: avalacao.dataAvaliacao)
            
            
            if soDiahj.day == soDia.day{
                avaliacoes.append(avalacao)
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        calendario.calendarioView()
        UIApplication.sharedApplication().registerUserNotificationSettings(UIUserNotificationSettings(forTypes: .Alert | .Badge | .Sound, categories: nil))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avaliacoes.count
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tarefa", forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        var avalacoes = avaliacoes[row] as Avaliacao
        cell.textLabel?.text = avalacoes.nomeAvaliacao
        
        
        return cell
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
