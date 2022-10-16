//
//  ViewControllerLose.swift
//  pokemonGame
//
//  Created by John Pill on 15/10/2022.
//

import UIKit

class ViewControllerLose: UIViewController {

    @IBOutlet weak var losesLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winsLabel.text = "Wins: \(wins)"
        losesLabel.text = "Loses: \(loses)"

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func newGameButton(_ sender: Any) {
        
        
        
    }
    
    

}
