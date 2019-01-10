//
//  GameViewController+tableView.swift
//  DesafioDojoGVN
//
//  Created by Thiago Cavalcante de Oliveira on 09/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Functions TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.listPeople.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        self.tableView.rowHeight = 80
        if let viewModel = self.viewModel {
            cell.textLabel?.text = viewModel.listManager[indexPath.row].capitalized
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.setCategorySelected(index: indexPath.row)
        viewModel?.validCategories(killer: killerLabel.text ?? "", weapon: weaponLabel.text ?? "", local: localLabel.text ?? "")
    }
    
    
    
}


