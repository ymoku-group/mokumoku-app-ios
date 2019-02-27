//
//  UIColor+rgb+hex.swift
//  mokumoku-app-ios
//
//  Created by aseo on 2019/02/28.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /// RGB値とアルファ値でUIColorを生成する
    ///
    /// アルファ値は0 ~ 1、それ以外は0 ~ 255の値を指定する。
    /// - Parameters:
    ///   - r: red
    ///   - g: green
    ///   - b: blue
    ///   - alpha: アルファ値
    /// - Returns: RGB値とアルファ値から生成したUIColor
    class func RGB(r: Int, g: Int, b: Int, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    /// HEXの文字列でUIColorを生成する
    ///
    /// - Parameter hex: HEX
    /// - Returns: HEXから生成したUIColor
    class func colorWithHexString (_ hex:String) -> UIColor {
        let cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if ((cString as String).count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(with: NSRange(location: 0, length: 2))
        let gString = (cString as NSString).substring(with: NSRange(location: 2, length: 2))
        let bString = (cString as NSString).substring(with: NSRange(location: 4, length: 2))
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(
            red: CGFloat(Float(r) / 255.0),
            green: CGFloat(Float(g) / 255.0),
            blue: CGFloat(Float(b) / 255.0),
            alpha: CGFloat(Float(1.0))
        )
    }
}
