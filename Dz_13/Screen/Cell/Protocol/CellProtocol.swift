//
//  Protocol.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import Foundation


protocol CellProtocol: AnyObject {
    static var reuseId: String {get}
    func setupCell(item: Model)
}
