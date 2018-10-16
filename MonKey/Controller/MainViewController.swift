//
//  MainViewController.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/13/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


struct Operation {
    let type: opertationType
    let amount: String
    let time: String
}

enum opertationType: String {
    case income = "Доходы"
    case costs = "Расходы"
    case transfers = "Переводы"
}

class MainViewController: UITableViewController {
    
    var testArray = [Operation]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainCell
        
        cell.operationNameLabel.text = testArray[indexPath.row].type.rawValue
        cell.operationTypeView.backgroundColor = UIColor.OperationColor.incomeColor
        
        cell.amountLabel.text = testArray[indexPath.row].amount
        
        cell.layer.cornerRadius = 15
//        cell.layer.borderColor = UIColor.red.cgColor
//        cell.layer.borderWidth = 3
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MainCell.self, forCellReuseIdentifier: "cell")
        testArray = [Operation.init(type: .income, amount: "+ 10 000", time: "13:49"), Operation.init(type: .costs, amount: "- 5 000", time: "12:10")]
        setNavBarItem()
    }
    
    func setNavBarItem() {
        self.navigationItem.title = "История"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
    }
    
    @objc func logout() {
        LoginManager.shared.logout()
        RootVCSwitcher.shared.presentLoginVC()
    }
}

extension UIColor {
    struct OperationColor {
        static var incomeColor: UIColor { return UIColor(red: 80/255, green: 181/255, blue: 210/255, alpha: 1.0) }
        static var costsColor: UIColor { return UIColor(red: 218/255, green: 150/255, blue: 173/255, alpha: 1.0) }
        static var transfersColor: UIColor { return UIColor(red: 170/255, green: 148/255, blue: 207/255, alpha: 1.0) }
    }
}
