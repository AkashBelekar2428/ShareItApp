//
//  LottiesCVC.swift
//  ShareIt
//
//  Created by Reapmind on 07/02/23.
//

import UIKit
import Lottie
class OnBoardingCVC: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var descriptionLbl:UILabel!
    @IBOutlet weak var onBoardingImgs:UIImageView!
    
    func setup(_ slide:OnBoardingModel){
        titleLbl.text = slide.title
        descriptionLbl.text = slide.description
        onBoardingImgs.image = slide.img
    }
  //  @IBOutlet weak var lottieView:UIView!
    
 //   private var shareItLottiesAnimation:LottieAnimationView?

//    func PlayAnimation(file: String){
//        shareItLottiesAnimation = .init(name: file)
//        shareItLottiesAnimation!.frame = lottieView.bounds
//        shareItLottiesAnimation!.contentMode = .scaleAspectFit
//        shareItLottiesAnimation!.loopMode = .loop
//        shareItLottiesAnimation!.animationSpeed = 1.5
//        lottieView.insertSubview(shareItLottiesAnimation!, at: 0)
//        shareItLottiesAnimation?.play()
//     }
}
