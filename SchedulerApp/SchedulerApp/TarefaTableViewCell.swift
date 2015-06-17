//
//  TarefaTableViewCell.swift
//  SchedulerApp
//
//  Created by Felipe Marques Ramos on 16/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class TarefaTableViewCell: UITableViewCell {

    @IBOutlet weak var tarefa: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
