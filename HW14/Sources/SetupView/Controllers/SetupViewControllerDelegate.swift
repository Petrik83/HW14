//
//  SetupViewControllerDelegate.swift
//  HW14
//
//  Created by Александр Петрович on 21.01.2022.
//

import UIKit

extension SetupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [1, 1]:
            navigationController?.pushViewController(WiFiViewController(), animated: true)
        case [1, 2]:
            navigationController?.pushViewController(BluetoothViewController(), animated: true)
        default:
            print("Нажата клавиша \(SetupViewController.setupModel[indexPath.section].options[indexPath.row].title)")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
