//
//  BackViewController.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import UIKit

final class BackViewController: UIViewController {

    private lazy var button: UIButton = {
        $0.setTitle("DZ_13", for: .normal)
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 15
        $0.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 20)
        return $0
    }(UIButton(frame: CGRect(x: 20, y: 450, width: view.frame.width - 40, height: 50), primaryAction: action))
    
    
    lazy var action = UIAction { [weak self] _ in
        let mainVC = ViewController()
        self?.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        view.addSubview(button)
    }


}
