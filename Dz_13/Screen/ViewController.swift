//
//  ViewController.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let item = ModelSection.mockData()

    
    private lazy var textLabel: UILabel = {
        .config(view: $0) { [weak self] view in
            view.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
            view.font = UIFont(name: "Ubuntu-Bold", size: 20)
            view.textAlignment = .center
            view.textColor = .white
            view.numberOfLines = 0
        }
    }(UILabel())
    
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: IconCollectionViewCell.reuseId)
        $0.register(NextCollectionViewCell.self, forCellWithReuseIdentifier: NextCollectionViewCell.reuseId)
        $0.backgroundColor = .black
        return $0
    }(UICollectionView(frame: CGRect(x: 30, y: 244, width: view.frame.width - 60, height: 600), collectionViewLayout: getLayout()))
    
    
    private func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, _ in
            switch section {
            case 0: return self?.makeIconSection()
            default: return self?.makeNextSection()
            }
        }
    }
    
    private func makeIconSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(92))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
    
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func makeNextSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 130, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
         let titleFont = UIFont(name: "Ubuntu-Bold", size: 30)
         let title = "О нас"
         let titleSize = title.size(withAttributes: [.font: titleFont!])

         let frame = CGRect(x: 0, y: 0, width: titleSize.width, height: 20.0)
         let titleLabel = UILabel(frame: frame)
         titleLabel.font = titleFont
         titleLabel.textColor = .white
         titleLabel.textAlignment = .center
         titleLabel.text = title
         navigationItem.titleView = titleLabel
         navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
//
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family \(family) Font names: \(names)")
//            
//        }
        
        [textLabel, collectionView].forEach{
            view.addSubview($0)
        }
        
        makeConstraint()
        
    }
    
    private func makeConstraint() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 154),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            
        
        ])
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        item.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item[section].model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let items = item[indexPath.section].model[indexPath.item]
        
        switch indexPath.section {
            
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconCollectionViewCell.reuseId, for: indexPath) as? IconCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: items)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NextCollectionViewCell.reuseId, for: indexPath) as? NextCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: items)
            return cell
        }
        
    }
    
    
}

