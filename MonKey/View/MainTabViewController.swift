//
//  MainTabViewController.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/27/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import UIKit
import SnapKit

class MainTabViewController: UITabBarController {
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named:"add.png"), for: .normal)
        button.addTarget(self, action: #selector(openAddViewController), for: .touchUpInside)
        button.backgroundColor = UIColor.OperationColor.categoryColor
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createTabBarElement(title: "История", image: "time.png", vc: WalletViewController()), createTabBarElement(title: "Настройки", image: "settings.png", vc: SettingsViewController())]
        self.view.insertSubview(addButton, aboveSubview: self.tabBar)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.tintColor = .black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addButton.frame = CGRect.init(x: self.tabBar.center.x - 32, y: self.view.bounds.height - 74, width: 64, height: 64)
        addButton.layer.cornerRadius = 32
    }
    
    @objc func openAddViewController() {
        RootVCSwitcher.shared.presentNewOperation()
    }
    
    func createTabBarElement(title: String, image: String, vc: UIViewController) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)
        return navController
    }
    
}
