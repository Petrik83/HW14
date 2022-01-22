//
//  WiFiViewControllerDataSource.swift
//  HW14
//
//  Created by Александр Петрович on 22.01.2022.
//

import UIKit

extension WiFiViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return WiFiViewController.wiFiSettingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WiFiViewController.wiFiSettingsData[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = setCellStyle(style: WiFiViewController.wiFiSettingsData[indexPath.section].options[indexPath.row].style)
        
        switch WiFiViewController.wiFiSettingsData[indexPath.section].options[indexPath.row].type {
        case .none:
            cell.accessoryType = .none
        case .disclosureIndicator:
            cell.accessoryType = .disclosureIndicator
        case .switchCell:
            let wiFiSwitch = UISwitch()
            wiFiSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            
            if let wiFiSwitchPosition = SetupViewController.setupModel[1].options[1].detailTextLabel {
                if wiFiSwitchPosition == "Выкл." {
                    wiFiSwitch.setOn(false, animated: true)
                } else {
                    wiFiSwitch.setOn(true, animated: true)
                }
            }
            
            cell.accessoryView = wiFiSwitch
            cell.selectionStyle = .none
        case .detailButton:
            cell.accessoryType = .detailButton
        }
        
        if indexPath.section == 0 && indexPath.row == 1 {
            cell.imageView?.image = UIImage(named: "check")
            cell.accessoryType = .detailButton
        }
        
        cell.textLabel?.text = WiFiViewController.wiFiSettingsData[indexPath.section].options[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return WiFiViewController.wiFiSettingsData[section].title
        }
        return nil
    }
    
    @objc func switchChanged(_ sender : UISwitch!) {
        
        if sender.isOn {
            WiFiViewController.wiFiSettingsData = WiFiViewController.wiFiOnSettingsData
            if SetupViewController.setupModel[safe: 1]?.options[safe: 1]?.detailTextLabel != nil {
                SetupViewController.setupModel[1].options[1].detailTextLabel = "Вкл."
            }
            
            wiFiView?.wiFitableView.reloadData()
            wiFiView?.wiFiSwitch.setOn(true, animated: true)
        } else {
            WiFiViewController.wiFiSettingsData = Section.getWiFiData()
            if SetupViewController.setupModel[safe: 1]?.options[safe: 1]?.detailTextLabel != nil {
                SetupViewController.setupModel[1].options[1].detailTextLabel = "Выкл."
            }
            wiFiView?.wiFiSwitch.setOn(false, animated: true)
            wiFiView?.wiFitableView.reloadData()
        }
    }
}

