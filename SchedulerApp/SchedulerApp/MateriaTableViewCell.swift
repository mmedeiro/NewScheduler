//
//  MateriaTableViewCell.swift
//  SchedulerApp
//
//  Created by Guilherme on 18/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class MateriaTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeAvaliacao: UILabel!
    
    @IBOutlet weak var notaAvaliacao: UILabel!
    
    @IBOutlet weak var dataAvaliacao: UILabel!
    
    var avaliacao: Avaliacao?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
