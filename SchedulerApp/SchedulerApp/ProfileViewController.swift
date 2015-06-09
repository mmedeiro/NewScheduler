//
//  ProfileViewController.swift
//  SchedulerApp
//
//  Created by Mariana Medeiro on 09/06/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var PeriodLbl: UILabel!
    @IBOutlet weak var CourseLbl: UILabel!
    @IBOutlet weak var NameLbl: UILabel!
    @IBOutlet weak var LastHomeworkLbl: UILabel!
    @IBOutlet weak var NextHomeworkLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
