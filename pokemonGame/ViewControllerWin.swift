//
//  ViewControllerWin.swift
//  pokemonGame
//
//  Created by John Pill on 15/10/2022.
//

import UIKit

class ViewControllerWin: UIViewController {

    @IBOutlet weak var losesLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        winsLabel.text = "Wins: \(wins)"
        losesLabel.text = "Loses: \(loses)"
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
