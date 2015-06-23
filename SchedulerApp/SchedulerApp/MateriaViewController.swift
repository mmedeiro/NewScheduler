//
//  MateriaViewController.swift
//  SchedulerApp
//
//  Created by Felipe Marques Ramos on 17/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class MateriaViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var materia: Materia?
    
    var avaliacoes =  Array<Avaliacao>()
    var tdsAvaliacoes: Array<Avaliacao>?
    var avaliacao: Avaliacao?

    
    @IBOutlet weak var tarefaTableView: UITableView!
    
    
    override func viewWillAppear(animated: Bool) {
        avaliacoes = Array<Avaliacao>()
        tdsAvaliacoes = AvaliacaoManager.sharedInstance.Avaliacao()!
        for avalacao in tdsAvaliacoes!{
            if avalacao.pertenceMateria == materia!{
                avaliacoes.append(avalacao)
            }
        }
        self.tarefaTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tarefaTableView.dataSource = self
        tarefaTableView.delegate = self
       self.navigationItem.title = materia!.nomeMateria
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return avaliacoes.count
    }
    
    func tableView(tarefaTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tarefaTableView.dequeueReusableCellWithIdentifier("materiaCell", forIndexPath: indexPath) as! MateriaTableViewCell
        
        let row = indexPath.row as Int
        cell.avaliacao = avaliacoes[row]
        
        
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy  hh:mm"
        
        var strDate = dateFormatter.stringFromDate(cell.avaliacao!.dataAvaliacao)
        
        
        cell.nomeAvaliacao.text = cell.avaliacao!.nomeAvaliacao
        cell.notaAvaliacao.text = cell.avaliacao!.notaAvaliacao as String
        cell.dataAvaliacao.text = strDate

        if cell.avaliacao!.statusAvaliacao{
            cell.statusAvaliacao.text = "Atividade Entregue"
        }else{
            cell.statusAvaliacao.text = "Atividade não entregue"}
        
        
      //  cell.statusAvaliacao.text = "\(cell.avaliacao!.statusAvaliacao)"
        
        
        return cell
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var mView = segue.destinationViewController as! AdicionarMateriaTableViewController
        
        if segue.identifier == ""{
            mView.edit = false
        }
        
        mView.materia = materia
    }


}
