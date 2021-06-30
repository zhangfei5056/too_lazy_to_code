//
//  Tools.swift
//  Demo_UITableView_autoHeight
//
//  Created by Yuan Cao on 6/28/21.
//

import UIKit
/**

 usage: `ColorUtils.color(withHexValue: 0x000000, alpha: 0.6)`

 `ColorUtils.color(withHexValue: 0xA06711).withAlphaComponent(0.6)`
 */
class ColorUtils {
    static func color(withHexValue: UInt64, alpha: CGFloat = 1.0) -> UIColor {

        let mask = 0x000000FF
        let r = Int(withHexValue >> 16) & mask
        let g = Int(withHexValue >> 8) & mask
        let b = Int(withHexValue) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        return UIColor.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
