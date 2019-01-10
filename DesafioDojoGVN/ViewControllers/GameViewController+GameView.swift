//
//  GameViewController+GameView.swift
//  DesafioDojoGVN
//
//  Created by Thiago Cavalcante de Oliveira on 09/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

protocol GameView {
    func setTextCategory(category:String)
    func setKillerSelected(killer:String)
    func setWeaponSelected(weapon:String)
    func setLocalSelected(local:String)
    func HideButtonAnalyze(status:Bool)
    func reloadData()
    func showAlertView(title:String,msg:String)
    func successView(numberAttempts:Int)
}

extension GameViewController: GameView {
    
    func successView(numberAttempts:Int) {
        viewSuccess.isHidden = false
        numberAttemptsLabel.text = String(describing: numberAttempts)
    }
    
    func showAlertView(title:String,msg: String) {
        showAlert(title: title, message: msg)
    }
    
    func HideButtonAnalyze(status:Bool) {
        buttonAnalyze.isHidden = status
    }
    func setKillerSelected(killer: String) {
        killerLabel.text = killer
    }
    
    func setWeaponSelected(weapon: String) {
        weaponLabel.text = weapon
    }
    func setLocalSelected(local: String) {
        localLabel.text = local
    }
    func setTextCategory(category:String) {
        categoryLabel.text = category
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    
}
