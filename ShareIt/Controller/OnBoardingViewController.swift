//
//  LottiesLaunchViewController.swift
//  ShareIt
//
//  Created by Reapmind on 07/02/23.
//

import UIKit
import Lottie

class OnBoardingViewController: UIViewController {
    @IBOutlet weak var LottiesCv:UICollectionView!
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    var animationArray = ["Lottie1","Lottie2","Lottie3"]
    
    var slide:[OnBoardingModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        LottiesCv.register(UINib(nibName: "LottiesCVC", bundle: nil), forCellWithReuseIdentifier: "LottiesCVC")
        LottiesCv.delegate = self
        LottiesCv.dataSource = self
        
    }
    

   
    @IBAction func NextBtnClicked(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
extension OnBoardingViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animationArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LottiesCVC", for: indexPath) as! OnBoardingCVC
        cell.PlayAnimation(file: animationArray[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
