//
//  MainCell.swift
//  MonKey
//
//  Created by Rodion Kuskov on 10/15/18.
//  Copyright © 2018 Rodion Kuskov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MainCell: UITableViewCell {
    
    var operationName: String?
    var amount: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subview()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let name = operationName else { return }
        operationNameLabel.text = name
        
        guard let amout = amount else { return }
        amountLabel.text = amout
//        if let name = operationName {
//            operationNameLabel.text = name
//        }
    }
    
    func subview() {
        self.addSubview(operationTypeView)
        self.addSubview(operationNameLabel)
        self.addSubview(amountLabel)
    }
    
    func layout() {
        operationTypeView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35).isActive = true
        operationTypeView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        operationTypeView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        operationTypeView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        operationTypeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        operationNameLabel.centerXAnchor.constraint(equalTo: operationTypeView.centerXAnchor).isActive = true
        operationNameLabel.centerYAnchor.constraint(equalTo: operationTypeView.centerYAnchor).isActive = true
        
        amountLabel.leftAnchor.constraint(equalTo: operationNameLabel.rightAnchor, constant: 50).isActive = true
        amountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
    }
    
    lazy var operationTypeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    lazy var operationNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.OperationColor.incomeColor
        label.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        return label
    }()
     
}
