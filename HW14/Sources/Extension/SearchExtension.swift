//
//  SearchExtension.swift
//  HW14
//
//  Created by Александр Петрович on 21.01.2022.
//

import UIKit
extension SetupViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
}
