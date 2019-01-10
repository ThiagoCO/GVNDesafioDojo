//
//  GameViewModel.swift
//  DesafioDojoGVN
//
//  Created by Thiago Cavalcante de Oliveira on 09/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class GameViewModel{
    
    // MARK: - Variables
    var listPeople:[String]
    var listWeapon:[String]
    var listPlaces:[String]
    var listManager:[String]
    var attempts:Int = 0
    var view:GameView
    var suspect:Suspect?
    
    // MARK: - Functions
    init(view:GameView, _ suspect:Suspect?){
        self.listPeople = CategoriesDAO().listPeople()
        self.listWeapon = CategoriesDAO().listWeapon()
        self.listPlaces = CategoriesDAO().listPlaces()
        self.listManager = self.listPeople
        self.view = view
        self.suspect = suspect
    }
    
    func nextCategory() {
        if(listManager == listPeople) {
            listManager = listWeapon
            view.setTextCategory(category: "Categoria: Armas")
        }
        else if(listManager == listWeapon) {
            listManager = listPlaces
            view.setTextCategory(category: "Categoria: Locais")
        }
        else {
            listManager = listPeople
            view.setTextCategory(category: "Categoria: Pessoas")
        }
        view.reloadData()
    }
    
    func setCategorySelected(index:Int) {
        if(listManager == listPeople) {
            view.setKillerSelected(killer: listPeople[index])
        }
        else if(listManager == listWeapon) {
            view.setWeaponSelected(weapon: listWeapon[index])
        }
        else {
            view.setLocalSelected(local: listPlaces[index])
        }
    }
    
    func validCategories(killer:String,weapon:String,local:String) {
        if(!killer.isEmpty && !weapon.isEmpty && !local.isEmpty){
            view.HideButtonAnalyze(status: false)
        }
        else{
            view.HideButtonAnalyze(status: true)
        }
    }
    
    func validSuspect(suspectSelected:Suspect) {
        attempts+=1
        var listCategoriesError:[String] = []
        if(suspect?.person != suspectSelected.person) {
            listCategoriesError.append("A pessoa escolhida não e o Assassino: \(suspectSelected.person)")
        }
        if(suspect?.weapon != suspectSelected.weapon) {
            listCategoriesError.append("Essa não foi a arma utilizada no Assassinato: \(suspectSelected.weapon)")
        }
        if(suspect?.local != suspectSelected.local) {
            listCategoriesError.append("Esse não foi o local de assassinato: \(suspectSelected.local)")
        }
        
        if(listCategoriesError.count == 0){
            view.successView(numberAttempts:attempts)
        }
        else {
            if let msg = listCategoriesError.randomElement() {
                view.showAlertView(title: "Palpite errado, Tente novamente", msg: "Dica: \(msg))")
            }
        }
        
    }
}
