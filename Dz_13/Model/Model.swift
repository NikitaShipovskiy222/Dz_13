//
//  Model.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import Foundation


struct Model: Identifiable {
    var id = UUID().uuidString
    var text: String
    var icon: String? = nil
    var textNext: String? = nil
    var arrow: String? = nil
}
