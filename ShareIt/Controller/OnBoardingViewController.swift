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
    
    var slide:[OnBoardingModel] = []
    
    var currentPage = 0{
        didSet{
            pageController.currentPage = currentPage
            if currentPage == slide.count - 1{
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        LottiesCv.register(UINib(nibName: "OnBoardingCVC", bundle: nil), forCellWithReuseIdentifier: "OnBoardingCVC")
        LottiesCv.delegate = self
        LottiesCv.dataSource = self
         slide = [
        OnBoardingModel(title: "Super fast speed", description: "Send and receive at up to 40Mb/s", img: #imageLiteral(resourceName: "HandShake")),
        OnBoardingModel(title: "Supports all files", description: "Send multiple files in one go", img: #imageLiteral(resourceName: "computerTraning")),
        OnBoardingModel(title: "Share files offline", description: "Transfer files anytime and anywhere", img: #imageLiteral(resourceName: "Agents")),
                        ]
    }
    @IBAction func NextBtnClicked(_ sender: UIButton) {
        if currentPage == slide.count - 1{
            print("Go to next Page")
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
                //   self.navigationController?.pushViewController(vc, animated: true)
            present(vc, animated: true, completion: nil)

        }else{
            currentPage += 1
            let indexpath = IndexPath(item: currentPage, section: 0)
            self.LottiesCv.isPagingEnabled = false
            self.LottiesCv.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
      }
    }
}
extension OnBoardingViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCVC", for: indexPath) as! OnBoardingCVC
        cell.setup(slide[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.LottiesCv.isPagingEnabled = true
        let witdh = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / witdh)
    }
    
    
}
