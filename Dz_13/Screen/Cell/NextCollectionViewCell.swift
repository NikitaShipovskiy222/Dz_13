//
//  NextCollectionViewCell.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import UIKit

final class NextCollectionViewCell: UICollectionViewCell, CellProtocol {
    
    static var reuseId: String = "NextCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainWhite
        clipsToBounds = true
        layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var lilTextLabel: UILabel = {
        $0.font = UIFont(name: "Ubuntu-Regular", size: 12)
        $0.textAlignment = .left
        $0.textColor = .lightGray
        $0.clipsToBounds = true
        $0.numberOfLines = 0
        return $0
    }(UILabel(frame: CGRect(x: 30, y: 22, width: frame.width - 150, height: 16)))
    
    
    private lazy var nextLabel: UILabel = {
        $0.font = UIFont(name: "Ubuntu-Bold", size: 20)
        $0.textColor = .mainBlack
        $0.clipsToBounds = true
        return $0
    }(UILabel(frame: CGRect(x: lilTextLabel.frame.width + 41, y: 18, width: frame.width - 250, height: 23)))
    
    private lazy var imgArrowNext: UIImageView = {
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: nextLabel.frame.width + 211, y: 20, width: 20, height: 20)))
    

    
    func setupCell(item: Model) {
        lilTextLabel.text = item.text
        nextLabel.text = item.textNext
        imgArrowNext.image = UIImage(named: item.arrow ?? "")
        
        addSubview(lilTextLabel)
        addSubview(nextLabel)
        addSubview(imgArrowNext)
    
    }
    
}
