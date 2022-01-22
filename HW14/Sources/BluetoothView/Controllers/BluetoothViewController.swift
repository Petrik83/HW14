//
//  BluetoothViewController.swift
//  HW14
//
//  Created by Александр Петрович on 22.01.2022.
//

import UIKit

class BluetoothViewController: UIViewController {
    
    static var bluetoothSettingsData = Section.getBluetoothOffData()
    static var bluetoothOnSettingsData = Section.getBluetoothOnData()
    
    var bluetoothView: BluetoothView? {
        guard isViewLoaded else { return nil }
        return view as? BluetoothView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "Bluetooth"
        view = BluetoothView()
        bluetoothView?.bluetoothTableView.dataSource = self
        bluetoothView?.bluetoothTableView.delegate = self
    }
    
}
