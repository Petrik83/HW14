//
//  WiFiViewController.swift
//  HW14
//
//  Created by Александр Петрович on 22.01.2022.
//

import UIKit

class WiFiViewController: UIViewController {
    static var wiFiSettingsData = Section.getWiFiData()
    static let wiFiOnSettingsData = Section.getWiFiOnData()
    
    var wiFiView: WiFiView? {
        guard isViewLoaded else { return nil }
        return view as? WiFiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        title = "Wi-Fi"
        view = WiFiView()
        
        if let wiFiSwitch = SetupViewController.setupModel[safe: 1]?.options[safe: 1]?.detailTextLabel {
            if wiFiSwitch  == "Вкл." {
                WiFiViewController.wiFiSettingsData = WiFiViewController.wiFiOnSettingsData
            }
        }
        wiFiView?.wiFitableView.dataSource = self
        wiFiView?.wiFitableView.delegate = self
    }
}
