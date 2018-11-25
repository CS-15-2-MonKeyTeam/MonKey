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
        viewControllers = [createTabBarElement(title: "Счета", image: "wallet.png", vc: NewAccountViewController()), createTabBarElement(title: "Статистика", image: "chart.png", vc: StatisticViewController()), createTabBarElement(title: "История", image: "time.png", vc: HistoryViewController()), createTabBarElement(title: "Настройки", image: "settings.png", vc: SettingsViewController())]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(logout))
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
        let vc = NewOperationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func createTabBarElement(title: String, image: String, vc: UIViewController) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)
        self.tabBarController?.title = title
        return navController
    }
    
    @objc func logout() {
        LoginManager.shared.logout()
        RootVCSwitcher.shared.presentLoginVC()
    }

}
