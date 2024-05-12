//
//  UIView.ext.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import UIKit

extension UIView {
    static func config<T: UIView>(view: T, completion: @escaping (T) -> Void) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        completion(view)
        return view
    }
}
