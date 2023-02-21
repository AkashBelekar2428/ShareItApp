//
//  HistoryViewController.swift
//  ShareIt
//
//  Created by Reapmind on 14/02/23.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var receiveHistoryBtn:UIButton!
    @IBOutlet weak var sendHistoryBtn:UIButton!
    
    var didTap = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let receiveTapped = UITapGestureRecognizer(target: self, action: #selector(receiveBtnTapped))
        receiveHistoryBtn.addGestureRecognizer(receiveTapped)
        let SendTapped = UITapGestureRecognizer(target: self, action: #selector(sendBtnTapped))
        sendHistoryBtn.addGestureRecognizer(SendTapped)
        receiveHistoryBtn.layer.borderColor = UIColor.black.cgColor
        receiveHistoryBtn.layer.borderWidth = 1
        sendHistoryBtn.layer.borderColor = UIColor.black.cgColor
        sendHistoryBtn.layer.borderWidth = 1
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        receiveHistoryBtn.setTitleColor(.white, for: .normal)
//        receiveHistoryBtn.backgroundColor = .blue
//        sendHistoryBtn.setTitleColor(.blue, for: .normal)
//        sendHistoryBtn.backgroundColor = .white
    }
    @objc func receiveBtnTapped(){
        print("receiveHistoryBtn")
        receiveHistoryBtn.setTitleColor(.white, for: .normal)
        receiveHistoryBtn.backgroundColor = .blue
        
        sendHistoryBtn.setTitleColor(.blue, for: .normal)
        sendHistoryBtn.backgroundColor = .white
    }
    @objc func sendBtnTapped(){
        print("sendHistoryBtn")
        sendHistoryBtn.setTitleColor(.white, for: .normal)
        sendHistoryBtn.backgroundColor = .blue
        
        receiveHistoryBtn.setTitleColor(.blue, for: .normal)
        receiveHistoryBtn.backgroundColor = .white
        
    }
    private func selectHistoryBtn(){
        if didTap {
            receiveBtnTapped()
            sendHistoryBtn.setTitleColor(.white, for: .normal)
            sendHistoryBtn.backgroundColor = .blue
            didTap = true
        }else{
            sendBtnTapped()
            receiveHistoryBtn.titleLabel?.textColor = .white
            receiveHistoryBtn.backgroundColor = .blue
            didTap = false
        }
    }
}
