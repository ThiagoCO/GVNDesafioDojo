//
//  HomeViewController.swift
//  DesafioDojoGVN
//
//  Created by Thiago Cavalcante de Oliveira on 09/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var viewInstructions: UIView!
    
    //MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGame" {
            let game = segue.destination as! GameViewController
            game.suspect = Suspect(person: CategoriesDAO().listPeople().randomElement() ?? "Goku", weapon: CategoriesDAO().listWeapon().randomElement() ?? "Espada", local: CategoriesDAO().listPlaces().randomElement() ?? "San Francisco")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func buttonOpenInstructions(_ sender: Any) {
        viewInstructions.isHidden = false
    }
    @IBAction func buttonCloseInstruction(_ sender: Any) {
        viewInstructions.isHidden = true
    }
}
