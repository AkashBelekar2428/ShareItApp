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
    @IBOutlet weak var sendStackView:UIStackView!
    @IBOutlet weak var receivStackView:UIStackView!
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
        let sendViewtapped = UITapGestureRecognizer(target: self, action: #selector(sendBtnClicked))
        sendStackView.superview?.addGestureRecognizer(sendViewtapped)
        let inviteBtntapped = UITapGestureRecognizer.init(target: self, action: #selector(inviteBtnClicked))
        inviteLbl.isUserInteractionEnabled = true
        inviteLbl.addGestureRecognizer(inviteBtntapped)
        settingBtn.addTarget(self, action: #selector(settingBtnClicked), for: .touchUpInside)
        let receiveViewTapped = UITapGestureRecognizer.init(target: self, action: #selector(receiveBtnClicked))
        receivStackView.superview?.addGestureRecognizer(receiveViewTapped)
        PlayAnimation()
           
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationView!.play()
    }
    @objc func inviteBtnClicked(){
        print("InviteBtnTapped")
        let vc = storyboard?.instantiateViewController(withIdentifier: "InviteViewController") as! InviteViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func settingBtnClicked(){
        print("SettingBtnClicked")
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func sendBtnClicked(){
        print("SendBtnClicked")
        let vc = (storyboard?.instantiateViewController(withIdentifier: "TabBarController")) as! UITabBarController
        //self.navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true, completion: nil)
    }
    @objc func receiveBtnClicked(){
        print("Receive clicked")
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
        historyLbl.layer.cornerRadius = 10
        connectToPcLbl.layer.masksToBounds = true
        connectToPcLbl.layer.cornerRadius = 10
        inviteLbl.layer.masksToBounds = true
        inviteLbl.layer.cornerRadius = 10
    }
    
    
}
