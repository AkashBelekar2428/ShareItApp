//
//  SettingsViewController.swift
//  ShareIt
//
//  Created by Reapmind on 31/01/23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var userProfileImg:UIImageView!
    @IBOutlet weak var userNameLbl:UILabel!
    @IBOutlet weak var sentLbl:UILabel!
    @IBOutlet weak var receivedLbl:UILabel!
    @IBOutlet weak var filesLbl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.black

        userProfileImg.layer.cornerRadius = userProfileImg.frame.size.height/2
    }
    


}
