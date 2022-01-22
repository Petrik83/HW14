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
        wiFiView?.wiFitableView.dataSource = self
        wiFiView?.wiFitableView.delegate = self
    }
}
