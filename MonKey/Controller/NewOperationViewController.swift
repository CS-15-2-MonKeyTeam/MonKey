//
//  NewOperationViewController.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/28/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import UIKit
import Foundation
import SnapKit
import MapKit
import Apollo

class NewOperationViewController: UIViewController {
    
    var accountId: [GraphQLID]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Добавить сумму"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveOperation))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        subview()
        layout()
        showDatePicker()
//        getAccountID()
    }
    
    func subview() {
        self.view.addSubview(incomeButton)
        self.view.addSubview(outcomeButton)
        self.view.addSubview(transactionButton)
        self.view.addSubview(txtDatePicker)
        self.view.addSubview(selectDateLabel)
        self.view.addSubview(noteTextField)
        self.view.addSubview(noteLabel)
        self.view.addSubview(amountTextField)
        self.view.addSubview(amountLabel)
        self.view.addSubview(payeeTextField)
        self.view.addSubview(payeeLabel)
        
        self.view.addSubview(activityIndicator)
    }
    
//    func getAccountID() {
//        LoginManager.shared.apollo.fetch(query: AccountsQuery()) { (result, error) in
//            if let error = error {
//                print("\(error)")
//            }
//
//            guard let result = result?.data else { return }
//            let id = result.accounts.compactMap{$0.id}
//            let name = result.accounts.compactMap{$0.name}
//            self.accountId = id
//        }
//    }
    
    let datePicker = UIDatePicker()
    
    lazy var incomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Доход", for: .normal)
        button.setTitleColor(UIColor.OperationColor.categoryColor, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.OperationColor.categoryColor.cgColor
        button.backgroundColor = .white
        button.layer.cornerRadius = 17
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(changeButtonColor), for: .touchUpInside)
        return button
    }()
    
    lazy var transactionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Перевод", for: .normal)
        button.setTitleColor(UIColor.OperationColor.categoryColor, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 17
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.OperationColor.categoryColor.cgColor
        button.addTarget(self, action: #selector(changeButtonColor), for: .touchUpInside)
        return button
    }()
    
    lazy var outcomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Расход", for: .normal)
        button.setTitleColor(UIColor.OperationColor.categoryColor, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 17
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.OperationColor.categoryColor.cgColor
        button.addTarget(self, action: #selector(changeButtonColor), for: .touchUpInside)
        return button
    }()
    
    lazy var txtDatePicker: UITextField = {
        let datePicker = UITextField()
        datePicker.backgroundColor = .white
        datePicker.textAlignment = .right
        datePicker.placeholder = "Выберите дату"
        datePicker.setBottomBorder()
        return datePicker
    }()
    
    lazy var selectDateLabel: UILabel = {
        let label = UILabel()
        label.text = "📅 Дата"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var noteLabel: UILabel = {
        let label = UILabel()
        label.text = "🖋 Примечание"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "💸 Сумма"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var payeeLabel: UILabel = {
        let label = UILabel()
        label.text = "🦹🏻‍♂️ Назначение"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var amountTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.textAlignment = .right
        field.placeholder = "Добавьте сумму"
        field.keyboardType = .decimalPad
        field.resignFirstResponder()
        field.setBottomBorder()
        return field
    }()
    
    lazy var noteTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.textAlignment = .right
        field.placeholder = "Добавьте примечание"
        field.setBottomBorder()
        return field
    }()
    
    lazy var payeeTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.textAlignment = .right
        field.placeholder = "Добавьте назначение"
        field.setBottomBorder()
        return field
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .gray)
        ai.frame = view.bounds
        return ai
    }()
    
    func showDatePicker(){
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(datePickerFunc));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker
        
    }
    
    @objc func saveOperation() {
        activityIndicator.startAnimating()
        guard let amountString = amountTextField.text else { return }
        let amount = (amountString as NSString).doubleValue
        guard
            let id = self.accountId,
            let date = txtDatePicker.text,
            let comment = noteTextField.text,
            let payee = payeeTextField.text else {
                return
        }
        
        LoginManager.shared.apollo.perform(mutation: CreateExpenseMutation(amount: amount, accountId: "cjobn7mnj002i0936j0qq03te", date: date, comment: comment, payee: payee, categoryId: "cjo2u06wd001f0959l7xvryai")) { [weak self]
            (result, error) in
            
            if let error = error {
                print("\n\(error)\n")
            }
            self?.activityIndicator.stopAnimating()
            RootVCSwitcher.shared.presentTab()
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        amountTextField.resignFirstResponder()
    }
    
    @objc func changeButtonColor(button: UIButton) {
        if button.backgroundColor == UIColor.OperationColor.categoryColor {
            button.backgroundColor = .white
            button.setTitleColor(UIColor.OperationColor.categoryColor, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.OperationColor.categoryColor.cgColor
        } else {
            button.backgroundColor = UIColor.OperationColor.categoryColor
            button.setTitleColor(.white, for: .normal)
        }
    }
    
    @objc func datePickerFunc(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        txtDatePicker.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func layout() {
        incomeButton.snp.makeConstraints { (make) in
            make.width.equalTo(115)
            make.height.equalTo(35)
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        outcomeButton.snp.makeConstraints { (make) in
            make.width.equalTo(115)
            make.height.equalTo(35)
            make.top.equalToSuperview().offset(80)
            make.left.equalTo(incomeButton.snp.right).offset(10)
        }
        
        transactionButton.snp.makeConstraints { (make) in
            make.width.equalTo(115)
            make.height.equalTo(35)
            make.top.equalToSuperview().offset(80)
            make.right.equalTo(incomeButton.snp.left).offset(-10)
        }
        
        selectDateLabel.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(35)
            make.top.equalTo(transactionButton.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(15)
        }
        
        txtDatePicker.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-35)
            make.height.equalTo(35)
            make.top.equalTo(transactionButton.snp.bottom).offset(35)
            make.right.equalToSuperview().offset(-20)
        }
        
        noteLabel.snp.makeConstraints { (make) in
            make.width.equalTo(130)
            make.height.equalTo(35)
            make.top.equalTo(txtDatePicker.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(15)
        }
        
        noteTextField.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-35)
            make.height.equalTo(35)
            make.top.equalTo(selectDateLabel.snp.bottom).offset(35)
            make.right.equalToSuperview().offset(-20)
        }
        
        amountLabel.snp.makeConstraints { (make) in
            make.width.equalTo(130)
            make.height.equalTo(35)
            make.top.equalTo(noteTextField.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(15)
        }
        
        amountTextField.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-35)
            make.height.equalTo(35)
            make.top.equalTo(noteLabel.snp.bottom).offset(35)
            make.right.equalToSuperview().offset(-20)
        }
        
        payeeLabel.snp.makeConstraints { (make) in
            make.width.equalTo(130)
            make.height.equalTo(35)
            make.top.equalTo(amountTextField.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(15)
        }
        
        payeeTextField.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-35)
            make.height.equalTo(35)
            make.top.equalTo(amountLabel.snp.bottom).offset(35)
            make.right.equalToSuperview().offset(-20)
        }
    }
}
