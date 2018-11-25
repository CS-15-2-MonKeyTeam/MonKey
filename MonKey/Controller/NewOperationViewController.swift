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
    
    static var accountId: GraphQLID?
    var cashAccount: [String: String]?
    var cardAccount: [String: String]?
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
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
    
    lazy var walletLabel: UILabel = {
        let label = UILabel()
        label.text = "💳 Счет"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var chooseWalletButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Выбрать кошелек  ", for: .normal)
        button.setTitleColor(UIColor.OperationColor.categoryColor, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.OperationColor.categoryColor.cgColor
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 35)
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(openWalletView), for: .touchUpInside)
        return button
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
    
    @objc func openWalletView() {
        let vc = WalletViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func saveOperation() {
        activityIndicator.startAnimating()
        let amountString = amountTextField.text
        let amount = (amountString! as NSString).doubleValue
        guard
            let date = txtDatePicker.text,
            let comment = noteTextField.text,
            let payee = payeeTextField.text else {
                return
        }
        
        guard let accountId = NewOperationViewController.accountId else { return }
        
        // Remove this func from selector.
        LoginManager.shared.apollo.perform(mutation: CreateExpenseMutation(amount: amount, accountId: accountId, date: date, comment: comment, payee: payee, categoryId: "cjovg671n00090984itwn5n2v")) { [unowned self] (result, error) in
            if let error = error {
                print("\n\(error)\n")
                self.activityIndicator.stopAnimating()
            }
            
            self.activityIndicator.stopAnimating()
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
        
        walletLabel.snp.makeConstraints { (make) in
            
            make.height.equalTo(25)
            make.top.equalTo(payeeTextField.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(15)
        }
        
        chooseWalletButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(walletLabel.snp.centerY)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    func subview() {
        view.addSubview(incomeButton)
        view.addSubview(outcomeButton)
        view.addSubview(transactionButton)
        view.addSubview(txtDatePicker)
        view.addSubview(selectDateLabel)
        view.addSubview(noteTextField)
        view.addSubview(noteLabel)
        view.addSubview(amountTextField)
        view.addSubview(amountLabel)
        view.addSubview(payeeTextField)
        view.addSubview(payeeLabel)
        view.addSubview(activityIndicator)
        view.addSubview(walletLabel)
        view.addSubview(chooseWalletButton)
    }
}
