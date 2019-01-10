//
//  CategoriesDAO.swift
//  DesafioDojoGVN
//
//  Created by Thiago Cavalcante de Oliveira on 09/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

protocol CategoriesList {
    func listPeople() -> [String]
    func listWeapon() -> [String]
    func listPlaces() -> [String]
}

class CategoriesDAO: CategoriesList {
    
    func listPeople() -> [String] {
        let list = ["Silvio Santos", "Goku", "MC Catra",
                    "Dona Maria", "Faustão", "Xuxa"]
        return list
    }
    
    func listWeapon() -> [String] {
        let list = ["Peixeira", "Espada", "Veneno",
                    "Banana", "Trezoitão", "Kamehameha"]
        return list
    }
    
    func listPlaces() -> [String] {
        let list = ["Buteco da esquina", "Padaria do tio Zé", "San Francisco",
                    "Restaurante no Fim do Universo", "São Paulo", "Toronto"]
        return list
    }
}
