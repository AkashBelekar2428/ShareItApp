//
//  PermissionRequiredViewController.swift
//  ShareIt
//
//  Created by Reapmind on 03/02/23.
//

import UIKit

class PermissionRequiredViewController: UIViewController {
    @IBOutlet weak var openLocationView:UIView!
    @IBOutlet weak var openBluetoothView:UIView!
    @IBOutlet weak var openLocationBtn:UIButton!
    @IBOutlet weak var openBluetoothBtn:UIButton!

    var share = InviteViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Permission Required"
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.prefersLargeTitles = true
        openLocationView.layer.cornerRadius = 15
        openBluetoothView.layer.cornerRadius = 15
        openLocationBtn.layer.cornerRadius = 15
        openBluetoothBtn.layer.cornerRadius = 15

    }
    
    @IBAction func openLocationServiceBtnClicked(_sender:UIButton){
        self.share.navigateToDeviceSettingPage(url: "App-prefs:root=STORE&path=App%20Downloads")
        
    }
    
    @IBAction func openBliutoothBtnClicked(_sender:UIButton){
        self.share.navigateToDeviceSettingPage(url: "App-prefs:root=Bluetooth")
        
    }

   

}
