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
import Apollo

//struct Operation {
//    let type: opertationType
//    let amount: String
//    let time: String
//}
//
//enum opertationType: String {
//    case income = "Доходы"
//    case costs = "Расходы"
//    case transfers = "Переводы"
//}

class WalletViewController: UITableViewController {
    
    //    var testArray = [Operation]()
    // TODO:- Refactor this shit
    var categoryNameArray = [String]()
    var amountArray = [Double]()
    var titleArray = [String]()
    var accountNameArray = [String]()
    var accountIdArray = [GraphQLID]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amountArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainCell
        cell.operationNameLabel.text = titleArray[indexPath.row]
        cell.moneyTypeLabel.text = accountNameArray[indexPath.row]
        cell.categoryLabel.text = "In Progress"
        cell.amountLabel.text = String(amountArray[indexPath.row])
        cell.operationTypeView.backgroundColor = UIColor.OperationColor.incomeColor
        
        cell.layer.cornerRadius = 15
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MainCell.self, forCellReuseIdentifier: "cell")
        setNavBarItem()
        self.tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let id = self.accountIdArray[indexPath.row]
            self.deleteAction(id: id)
            self.amountArray.remove(at: indexPath.row)
            self.titleArray.remove(at: indexPath.row)
            self.accountNameArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func deleteAction(id: GraphQLID) {
        LoginManager.shared.apollo.perform(mutation: DeleteFinanceOperationMutation(id: id)) { (result, error) in
            if let error = error {
                print("error\(error)")
            }
        }
    }
    
    func fetchData() {
        LoginManager.shared.apollo.fetch(query: GetOperationsQuery()) { (result, error) in
            if let error = error {
                print("\(error)")
            }
            
            guard let result = result?.data else { return }
            
            let amount = result.financeOperations.compactMap{$0.amount}
            self.amountArray.append(contentsOf: amount)
            
            let typeNameTitle = result.financeOperations.compactMap{$0.__typename}
            self.titleArray.append(contentsOf: typeNameTitle)
            
            let accountName = result.financeOperations.compactMap{$0.account.name}
            self.accountNameArray.append(contentsOf: accountName)
            
            let accountId = result.financeOperations.compactMap{$0.id}
            self.accountIdArray.append(contentsOf: accountId)
            
            self.tableView.reloadData()
        }
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
        static var categoryColor: UIColor { return UIColor(red: 125/255, green: 166/255, blue: 230/255, alpha: 1.0) }
    }
}
