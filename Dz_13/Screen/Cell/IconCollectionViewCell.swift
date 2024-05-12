//
//  IconCollectionViewCell.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import UIKit

final class IconCollectionViewCell: UICollectionViewCell, CellProtocol{
    static var reuseId: String = "IconCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var circle = MakeCircle.makeCircle(x: 15, y: 13)
    
    private lazy var icnonImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 11, y: 12, width: 23, height: 23)))
    
    private lazy var textLabel: UILabel = {
        $0.font = UIFont(name: "Ubuntu-Regular", size: 16)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .left
        return $0
    }(UILabel(frame: CGRect(x: 72, y: 15, width: frame.width - 100, height: 36)))
    
    func setupCell(item: Model) {
        icnonImage.image = UIImage(named: item.icon ?? "")
        textLabel.text = item.text
        
        
        [icnonImage].forEach{
            circle.addSubview($0)
        }
        
        addSubview(circle)
        addSubview(textLabel)
        
    }

}
