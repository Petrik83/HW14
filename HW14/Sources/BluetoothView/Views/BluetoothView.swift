//
//  BluetoothView.swift
//  HW14
//
//  Created by Александр Петрович on 22.01.2022.
//

import UIKit

class BluetoothView: UIView {
    
    let bluetoothSwitch = UISwitch()
    
    lazy var bluetoothTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemGray6
        viewHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewHierarchy() {
        addSubview(bluetoothTableView)
    }
    
    private func setupLayout() {
        bluetoothTableView.translatesAutoresizingMaskIntoConstraints = false
        bluetoothTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        bluetoothTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        bluetoothTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        bluetoothTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
