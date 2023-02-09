//
//  UIView + Extension.swift
//  ShareIt
//
//  Created by Reapmind on 08/02/23.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius : CGFloat{
        get{return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
