//
//  etupViewControllerDelegate.swift
//  HW14
//
//  Created by Александр Петрович on 21.01.2022.
//

import UIKit

extension SetupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
//        case [1, 1]:
//            navigationController?.pushViewController(WiFiSettingsViewController(), animated: true)
//        case [1, 2]:
//            navigationController?.pushViewController(BluetothSettingsViewController(), animated: true)
        default:
            print("Нажата клавиша \(setupModel[indexPath.section].options[indexPath.row].title)")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
