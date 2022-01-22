//
//  SetupViewControllerDataSource.swift
//  HW14
//
//  Created by Александр Петрович on 21.01.2022.
//
import UIKit

extension SetupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SetupViewController.setupModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SetupViewController.setupModel[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var cell = tableView.dequeueReusableCell(withIdentifier: SetupView.idCell)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: SetupView.idCell)
        }
        
        cell = setCellStyle(style: SetupViewController.setupModel[indexPath.section].options[indexPath.row].style)
        
        switch SetupViewController.setupModel[indexPath.section].options[indexPath.row].type {
        case .none:
            cell?.accessoryType = .none
        case .disclosureIndicator:
            cell?.accessoryType = .disclosureIndicator
        case .switchCell:
            let AirmodeSwitch = UISwitch()
            AirmodeSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            AirmodeSwitch.setOn(switchPosition, animated: true)
            cell?.accessoryView = AirmodeSwitch
            cell?.selectionStyle = .none
        case .detailButton:
            cell?.accessoryType = .detailButton
        }
        
        cell?.imageView?.image = SetupViewController.setupModel[indexPath.section].options[indexPath.row].icon
        cell?.textLabel?.text = SetupViewController.setupModel[indexPath.section].options[indexPath.row].title
        cell?.detailTextLabel?.text = SetupViewController.setupModel[indexPath.section].options[indexPath.row].detailTextLabel
        return cell ?? UITableViewCell()
    }
    
    @objc func switchChanged(_ sender : UISwitch!){
        
        if sender.isOn {
            setupView?.tableView.cellForRow(at: IndexPath(row: 1, section: 1))?.detailTextLabel?.text = "Выкл."
            setupView?.tableView.cellForRow(at: IndexPath(row: 2, section: 1))?.detailTextLabel?.text = "Выкл."
            setupView?.tableView.cellForRow(at: IndexPath(row: 3, section: 1))?.detailTextLabel?.text = "Авиарежим"
            setupView?.tableView.cellForRow(at: IndexPath(row: 4, section: 1))?.detailTextLabel?.text = "Выкл."
            setupView?.tableView.cellForRow(at: IndexPath(row: 5, section: 1))?.detailTextLabel?.text = "Не подключено"
            switchPosition = true
        } else {
            setupView?.tableView.cellForRow(at: IndexPath(row: 1, section: 1))?.detailTextLabel?.text = SetupViewController.setupModel[1].options[1].detailTextLabel
            setupView?.tableView.cellForRow(at: IndexPath(row: 2, section: 1))?.detailTextLabel?.text = SetupViewController.setupModel[1].options[2].detailTextLabel
            setupView?.tableView.cellForRow(at: IndexPath(row: 3, section: 1))?.detailTextLabel?.text = SetupViewController.setupModel[1].options[3].detailTextLabel
            setupView?.tableView.cellForRow(at: IndexPath(row: 4, section: 1))?.detailTextLabel?.text = SetupViewController.setupModel[1].options[4].detailTextLabel
            setupView?.tableView.cellForRow(at: IndexPath(row: 5, section: 1))?.detailTextLabel?.text =  SetupViewController.setupModel[1].options[5].detailTextLabel
            switchPosition = false
        }
    }
}
