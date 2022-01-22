//
//  ViewController.swift
//  HW14
//
//  Created by Aliaksandr Piatrovich on 21.01.22.
//

import UIKit

class SetupViewController: UIViewController {
    
    static var setupModel = Section.getData()
    var switchPosition = false
    
    var setupView: SetupView? {
        guard isViewLoaded else { return nil }
        return view as? SetupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        view = SetupView()
        
        if let wiFiSwitch = SetupViewController.setupModel[safe: 1]?.options[safe: 1]?.detailTextLabel {
            if wiFiSwitch  == "Вкл." {
                WiFiViewController.wiFiSettingsData = WiFiViewController.wiFiOnSettingsData
            }
        }
        
        if let bluetoothSwitch = SetupViewController.setupModel[safe: 1]?.options[safe: 2]?.detailTextLabel {
            if bluetoothSwitch == "Вкл." {
                BluetoothViewController.bluetoothSettingsData = BluetoothViewController.bluetoothOnSettingsData
            }
        }
        
        setupView?.tableView.dataSource = self
        setupView?.tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView?.tableView.reloadData()
    }
}


