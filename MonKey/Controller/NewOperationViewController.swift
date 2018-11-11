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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveOperation))
        subview()
        layout()
        showDatePicker()
    }
    
    @objc func saveOperation() {
        LoginManager.shared.apollo.perform(mutation: CreateExpenseMutation(amount: 15.0, accountId: "cjo2ts18y000u095904e8nlk6", date: "2018-11-08", comment: "x", payee: "xx", categoryId: "cjo2u06wd001f0959l7xvryai")) { (result, error) in
            if let error = error {
                print("\n\(error)\n")
            }
            
            guard let result = result else { return }
            print("\n\nRESULT\n\(result)\n\n")
        }
    }
    
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
    
    lazy var mapPosition: UILabel = {
        let label = UILabel()
        label.text = "🚩 Местоположение"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var noteLabel: UILabel = {
        let label = UILabel()
        label.text = "🖋 Примечание"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var noteTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.textAlignment = .right
        field.placeholder = "Добавьте примечание"
        field.setBottomBorder()
        field.addTarget(self, action: #selector(textFieldDidChange(_:)),
                        for: UIControl.Event.editingChanged)
        return field
    }()
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        noteLabel.isHidden = true
    }
    
    lazy var mapButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(openMap), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.isHidden = true
        return button
    }()

    @objc func openMap() {
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
    
    let datePicker = UIDatePicker()
    
    
    func showDatePicker(){
        datePicker.datePickerMode = .dateAndTime
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "EE, MMM d, yyyy, hh:mm"
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
        
        mapButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(50)
        }
    }
    
    func subview() {
        self.view.addSubview(incomeButton)
        self.view.addSubview(outcomeButton)
        self.view.addSubview(transactionButton)
        self.view.addSubview(txtDatePicker)
        self.view.addSubview(selectDateLabel)
        self.view.addSubview(noteTextField)
        self.view.addSubview(noteLabel)
        self.view.addSubview(mapButton)
    }


    
}
