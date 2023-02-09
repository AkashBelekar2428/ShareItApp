//
//  HomeViewController.swift
//  ShareIt
//
//  Created by Reapmind on 31/01/23.
//

import Foundation
import UIKit
import Lottie

class HomeViewController: UIViewController {
    @IBOutlet weak var sendView:UIView!
    @IBOutlet weak var receiveView:UIView!
    @IBOutlet weak var historyLbl:UILabel!
    @IBOutlet weak var connectToPcLbl:UILabel!
    @IBOutlet weak var inviteLbl:UILabel!
    @IBOutlet weak var settingBtn:UIButton!
    @IBOutlet weak var AnimationView:UIView!
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setAllCornerRadius()
        let sendViewtapped = UITapGestureRecognizer.init(target: self, action: #selector(sendBtnClicked))
        sendView.addGestureRecognizer(sendViewtapped)
        let inviteBtntapped = UITapGestureRecognizer.init(target: self, action: #selector(inviteBtnClicked))
        inviteLbl.isUserInteractionEnabled = true
        inviteLbl.addGestureRecognizer(inviteBtntapped)
        settingBtn.addTarget(self, action: #selector(settingBtnClicked), for: .touchUpInside)
        let receiveViewTapped = UITapGestureRecognizer.init(target: self, action: #selector(receiveBtnClicked))
        receiveView.addGestureRecognizer(receiveViewTapped)
        PlayAnimation()
           
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationView!.play()
    }
    @objc func inviteBtnClicked(){
        print("tapped")
        let vc = storyboard?.instantiateViewController(withIdentifier: "InviteViewController") as! InviteViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func settingBtnClicked(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func sendBtnClicked(){
        let vc = (storyboard?.instantiateViewController(withIdentifier: "TabBarController")) as? UITabBarController
        present(vc!, animated: true, completion: nil)
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func receiveBtnClicked(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "PermissionRequiredViewController") as! PermissionRequiredViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   private func PlayAnimation(){
        animationView = .init(name: "ShareIt")
        animationView!.frame = AnimationView.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 1.5
        AnimationView.insertSubview(animationView!, at: 0)
    }
    private func setAllCornerRadius(){
        sendView.layer.cornerRadius = 20
        receiveView.layer.cornerRadius = 20
        historyLbl.layer.masksToBounds = true
        historyLbl.layer.cornerRadius = 20
        connectToPcLbl.layer.masksToBounds = true
        connectToPcLbl.layer.cornerRadius = 20
        inviteLbl.layer.masksToBounds = true
        inviteLbl.layer.cornerRadius = 20
    }
    
    
}
