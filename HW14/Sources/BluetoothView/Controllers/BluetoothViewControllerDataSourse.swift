//
//  BluetoothViewControllerDataSourse.swift
//  HW14
//
//  Created by Александр Петрович on 22.01.2022.
//

import UIKit

extension BluetoothViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return BluetoothViewController.bluetoothSettingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BluetoothViewController.bluetoothSettingsData[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = setCellStyle(style: BluetoothViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].style)
        
        switch BluetoothViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].type {
        case .none:
            cell.accessoryType = .none
        case .disclosureIndicator:
            cell.accessoryType = .disclosureIndicator
        case .switchCell:
            bluetoothView?.bluetoothSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            if SetupViewController.setupModel[1].options[2].detailTextLabel == "Выкл." {
                bluetoothView?.bluetoothSwitch.setOn(false, animated: true)
            } else {
                bluetoothView?.bluetoothSwitch.setOn(true, animated: true)
            }
            cell.accessoryView = bluetoothView?.bluetoothSwitch
            cell.selectionStyle = .none
        case .detailButton:
            cell.accessoryType = .detailButton
        }
        
        cell.textLabel?.text = BluetoothViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].title
        cell.detailTextLabel?.text = BluetoothViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].detailTextLabel
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return BluetoothViewController.bluetoothSettingsData[section].title
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let bluetoothSwitchPosition = bluetoothView?.bluetoothSwitch.isOn else { return nil}
        if section == 0 && bluetoothSwitchPosition  {
            return "Имя при обнаружении \"iPhone 12\""
        } else {
            if section == 0 && !bluetoothSwitchPosition {
                return "AirDrop, AirPlay, локатор, службы геолокации и разблокировка с apple Watch используют Bluetooth"
            }
        }
        return nil
    }
    
    @objc func switchChanged(_ sender : UISwitch!) {
        if sender.isOn {
            BluetoothViewController.bluetoothSettingsData = Section.getBluetoothOnData()
            SetupViewController.setupModel[1].options[2].detailTextLabel = "Вкл."
            bluetoothView?.bluetoothSwitch.setOn(true, animated: true)
            bluetoothView?.bluetoothTableView.reloadData()
        } else {
            BluetoothViewController.bluetoothSettingsData = Section.getBluetoothOffData()
            SetupViewController.setupModel[1].options[2].detailTextLabel = "Выкл."
            bluetoothView?.bluetoothSwitch.setOn(false, animated: true)
            bluetoothView?.bluetoothTableView.reloadData()
        }
    }
}
