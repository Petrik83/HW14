//
//  BluetoothViewControllerDelegate.swift
//  HW14
//
//  Created by Александр Петрович on 22.01.2022.
//

import UIKit

extension BluetoothViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [0, 0]:
            break
        default:
            BluetoothViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].detailTextLabel = "Подключено"
            BluetoothViewController.bluetoothOnSettingsData[indexPath.section].options[indexPath.row].detailTextLabel = "Подключено"
            bluetoothView?.bluetoothTableView.reloadData()
        }
    }
}
