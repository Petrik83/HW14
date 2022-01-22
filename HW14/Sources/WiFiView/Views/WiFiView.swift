//
//  WiFiView.swift
//  HW14
//
//  Created by Александр Петрович on 22.01.2022.
//

import UIKit

class WiFiView: UIView {
    let wiFiSwitch = UISwitch()
    
    lazy var wiFitableView: UITableView = {
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
        addSubview(wiFitableView)
    }
    
    private func setupLayout() {
        wiFitableView.translatesAutoresizingMaskIntoConstraints = false
        wiFitableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        wiFitableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        wiFitableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        wiFitableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
