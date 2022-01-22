//
//  SetCellStyle.swift
//  HW14
//
//  Created by Александр Петрович on 21.01.2022.
//

import UIKit

extension UIViewController {

    func setCellStyle(style: CellModel.CellStyle) -> UITableViewCell {
        switch style {
        case .subtitle:
            return UITableViewCell(style: .subtitle, reuseIdentifier: SetupView.idCell)
        case .value1:
            return UITableViewCell(style: .value1, reuseIdentifier: SetupView.idCell)
        case .value2:
            return  UITableViewCell(style: .value2, reuseIdentifier: SetupView.idCell)
        case .default:
            return  UITableViewCell(style: .default, reuseIdentifier: SetupView.idCell)
        }
    }
}
