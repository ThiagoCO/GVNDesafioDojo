//
//  GameViewController.swift
//  DesafioDojoGVN
//
//  Created by Thiago Cavalcante de Oliveira on 09/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewSuccess: UIView!
    @IBOutlet weak var killerLabel: UILabel!
    @IBOutlet weak var weaponLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var numberAttemptsLabel: UILabel!
    @IBOutlet weak var buttonAnalyze: UIButton!
    
    // MARK: - Variables
    var suspect:Suspect?
    var viewModel:GameViewModel?
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = GameViewModel(view:self,suspect)
        self.stepTableView()
        
    }
    func stepTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: = Actions
    
    @IBAction func buttonNextCategory(_ sender: Any) {
        viewModel?.nextCategory()
    }
    
    
    @IBAction func buttonAnalyzeSuspect(_ sender: Any) {
        viewModel?.validSuspect(suspectSelected: Suspect(person: killerLabel.text ?? "", weapon: weaponLabel.text ?? "", local: localLabel.text ?? ""))
    }
    
  
    @IBAction func backHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func buttonExit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
