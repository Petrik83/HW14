//
//  ViewController.swift
//  HW14
//
//  Created by Aliaksandr Piatrovich on 21.01.22.
//

import UIKit

class SetupViewController: UIViewController {
    
    var setupModel = Section.getData()
    var switchPosition = false
    
    var setupView: SetupView? {
        guard isViewLoaded else { return nil }
        return view as? SetupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        view = SetupView()
        
        setupView?.tableView.dataSource = self
        setupView?.tableView.delegate = self
    }


}


