//
//  WiFiViewControllerDelegat.swift
//  HW14
//
//  Created by Александр Петрович on 22.01.2022.
//

import UIKit

extension WiFiViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [0, 0]:
            break
        default:
            let temp = WiFiViewController.wiFiSettingsData[indexPath.section].options[indexPath.row]
            
            guard WiFiViewController.wiFiSettingsData[safe: 0]?.options.count != nil else { break }
            guard SetupViewController.setupModel[safe: 1]?.options[safe: 1]?.detailTextLabel != nil else { break }
            guard WiFiViewController.wiFiSettingsData[safe: 1]?.options != nil else { break }
            
            if WiFiViewController.wiFiSettingsData[0].options.count == 1 {
                WiFiViewController.wiFiSettingsData[indexPath.section].options.remove(at: indexPath.row)
                WiFiViewController.wiFiSettingsData[0].options.append(temp)
                SetupViewController.setupModel[1].options[1].detailTextLabel = temp.title
                wiFiView?.wiFitableView.reloadData()
            } else {
                if indexPath.section != 0 {
                    let temp1 = WiFiViewController.wiFiSettingsData[0].options[1]
                    WiFiViewController.wiFiSettingsData[1].options.append(temp1)
                    WiFiViewController.wiFiSettingsData[0].options.remove(at: 1)
                    WiFiViewController.wiFiSettingsData[indexPath.section].options.remove(at: indexPath.row)
                    WiFiViewController.wiFiSettingsData[0].options.append(temp)
                    wiFiView?.wiFitableView.reloadData()
                    SetupViewController.setupModel[1].options[1].detailTextLabel = temp.title
                }
            }
        }
    }
}
