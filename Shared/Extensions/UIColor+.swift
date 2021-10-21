//
//  UIColor+.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/22.
//


import UIKit

extension UIColor {
    
    static let textColor: UIColor = UIColor.changeAppearnceColor(light: .darkText, dark: .white)
    
    class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    /// ダークモードかどうかで色を変更する
    /// - Parameter light: ダークモードOFF時の色
    /// - Parameter dark: ダークモードON時の色
    class func changeAppearnceColor(light: UIColor, dark: UIColor) -> UIColor {
        let color: UIColor = UIColor { traitCollection -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? light : dark
        }
        return color
    }
}

