//
//  MakeCircle.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import UIKit

final class MakeCircle {
    
    static func makeCircle(x: CGFloat, y: CGFloat, w: CGFloat = 46, h: CGFloat = 46, radius: CGFloat = 23) -> UIView {
        {
            $0.layer.cornerRadius = radius
            $0.backgroundColor = UIColor(named: "mainGrey")
            $0.clipsToBounds = true
            return $0
        }(UIView(frame: CGRect(x: x, y: y, width: w, height: h)))
        
    }
    
}
