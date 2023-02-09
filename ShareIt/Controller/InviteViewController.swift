//
//  InviteViewController.swift
//  ShareIt
//
//  Created by Reapmind on 31/01/23.
//

import Foundation
import UIKit
import CoreLocation

class InviteViewController:UIViewController{
    
    @IBOutlet weak var noInternetNeddedTbl:UITableView!
    @IBOutlet weak var internetRequiredTbl:UITableView!
    
    @IBOutlet weak var noInternetHeight:NSLayoutConstraint!
    @IBOutlet weak var InternetNeddedHeight:NSLayoutConstraint!

    var noInternetImageArray = ["book.circle","book.circle"]
    var noInternetNameArray = ["Hotspot Mode","Bluetooth"]
    var InternetRequiredImageArray = ["book.circle","book.circle","book.circle"]
    var InternetRequiredNameArray = ["Share Link","QR Code","WhatsApp"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Invite Your Friends"
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.prefersLargeTitles = true
        noInternetNeddedTbl.delegate = self
        noInternetNeddedTbl.dataSource = self
        internetRequiredTbl.delegate = self
        internetRequiredTbl.dataSource = self
        noInternetNeddedTbl.register(UINib(nibName: "NoInternetNeddedTVC", bundle: nil), forCellReuseIdentifier: "NoInternetNeddedTVC")
        internetRequiredTbl.register(UINib(nibName: "InternetRequiredTVC", bundle: nil), forCellReuseIdentifier: "InternetRequiredTVC")
        
        noInternetNeddedTbl.reloadData()
        internetRequiredTbl.reloadData()
        
        self.noInternetNeddedTbl.separatorStyle = .none
        self.internetRequiredTbl.separatorStyle = .none
      
    }
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
         noInternetHeight.constant = noInternetNeddedTbl.contentSize.height
         InternetNeddedHeight.constant = internetRequiredTbl.contentSize.height
      }
    func navigateToDeviceSettingPage(url:String){
        if let url = URL(string:url) {
          if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
              UIApplication.shared.openURL(url)
            }
          }
            
        }
    }
}

extension InviteViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if noInternetNeddedTbl == tableView{
            return noInternetNameArray.count
        }else{
           return InternetRequiredNameArray.count
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if noInternetNeddedTbl == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoInternetNeddedTVC") as? NoInternetNeddedTVC
            cell?.selectionStyle = .none
            cell?.iconNameLbl.text = noInternetNameArray[indexPath.row]
            cell?.iconImg.image = UIImage(systemName: "book.circle")
//            cell?.iconImg.image = UIImage(named: "\(noInternetImageArray[indexPath.row])")
            
            return cell!
            
        }
        else{
            if internetRequiredTbl == tableView{
                let cell = tableView.dequeueReusableCell(withIdentifier: "InternetRequiredTVC") as? InternetRequiredTVC
                let name = InternetRequiredNameArray[indexPath.row]
                cell?.selectionStyle = .none
                cell?.iconNameLbl.text = name
               // cell?.iconImg.image = UIImage(named: "\(InternetRequiredImageArray[indexPath.row])")
                cell?.iconImg.image = UIImage(systemName: "book.circle")
                return cell!
            }
            
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == noInternetNeddedTbl{
         
            switch indexPath.row {
            case 0:
                print("row 1")
                let alter = UIAlertController(title: "Need Enable", message: "iOS version 9+ needs gps to enable", preferredStyle:.alert )
                
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { UIAlertAction in
                    print("ok")
            
                    self.navigateToDeviceSettingPage(url:"App-prefs:root=STORE&path=App%20Downloads")
                }
                let cancleAction = UIAlertAction(title: "Cancle", style: UIAlertAction.Style.cancel) { UIAlertAction in
                        print("Cancle")
                    }
                    alter.addAction(okAction)
                    alter.addAction(cancleAction)
                
                present(alter, animated: true, completion: nil)
                
            case 1:
                print("row 2")
                self.navigateToDeviceSettingPage(url: "App-prefs:root=Bluetooth")
                
            default:
                break
            }
        }
        else{
            if tableView == internetRequiredTbl{
                switch indexPath.row{
                case 0:
                    print("index path 0")
                    if let name = URL(string: "https://itunes.apple.com/us/app/myapp/idxxxxxxxx?ls=1&mt=8"), !name.absoluteString.isEmpty {
                      let objectsToShare = [name]
                      let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                      self.present(activityVC, animated: true, completion: nil)
                    } else {
                        
                    }
                    
                case 1:
                    print("index path 1")
                    self.navigateToDeviceSettingPage(url: "")
                case 2:
                    print("index path 2")
                    
//                    let urlWhats = "whatsapp://send?text=\("Hello World")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//
//                    let msg = message
                       let urlWhats = "whatsapp://send?text=\("Hello World")"
                       if  let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                           if let whatsappURL = NSURL(string: urlString) {
                               if  UIApplication.shared.canOpenURL(whatsappURL as URL ) {
                                   UIApplication.shared.open(whatsappURL as URL)
                               }
                           }
                       }
                    
                default:
                    break
                }
            }
        }
    }

}
extension InviteViewController{
func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}
}
