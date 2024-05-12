//
//  ModelSection.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import Foundation


struct ModelSection: Identifiable {
    var id = UUID().uuidString
    var model: [Model]
    
    static func mockData() -> [ModelSection] {
        let firstSection = [
        Model(text: "Lorem ipsum dolor sit amet consectetur.", icon: "bike"),
        Model(text: "Lorem ipsum dolor sit amet consectetur.", icon: "pool"),
        Model(text: "Lorem ipsum dolor sit amet consectetur.", icon: "volleyball"),
        Model(text: "Lorem ipsum dolor sit amet consectetur.", icon: "flag"),
        ]
        
        let secondSection = [
        Model(text: "Lorem ipsum dolor sit amet", textNext: "Далее", arrow: "arrow")
        ]
        
        let iconSection = ModelSection(model: firstSection)
        let nextSection = ModelSection(model: secondSection)
        
        return [iconSection, nextSection]
    }
}
