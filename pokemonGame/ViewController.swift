//
//  ViewController.swift
//  pokemonGame
//
//  Created by John Pill on 15/10/2022.
//

import UIKit
import SpriteKit

public var wins = 0
public var loses = 0


class ViewController: UIViewController {
    
    @IBOutlet weak var effectView: UIImageView!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var cpuScoreLabel: UILabel!
    @IBOutlet weak var cpuImage: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var newCardButton: UIButton!
    @IBOutlet weak var attackButton: UIButton!
    @IBOutlet weak var attack2Button: UIButton!
    
    
    
    var cpuRandomNumber = 0
    var playerRandomNumber = 0
    var playerTurn = false
    var gameOver = true
    var attackButtonPresses = 0
    
    
    
    var cpuHP = 0
    var playerHP = 0
    
    struct Card {
        let image: String
        let hp: Int
        let attack1: Int
        let attack2: Int
        let name: String
    }
    
    
    let cards = [
        Card(image: "card1", hp: 70, attack1: 10, attack2: 20, name: "Balbasaur"),
        Card(image: "card2", hp: 100, attack1: 60, attack2: 0, name: "Ivysaur"),
        Card(image: "card3", hp: 180, attack1: 130, attack2: 0, name:"Venusaur"),
        Card(image: "card4", hp: 150, attack1: 90, attack2: 0, name: "Radiant Venusaur"),
        Card(image: "card5", hp: 60, attack1: 10, attack2: 0, name: "Spinarak"),
        Card(image: "card6", hp: 60, attack1: 10, attack2: 0, name: "Charmander"),
        Card(image: "card7", hp: 90, attack1: 30, attack2: 100, name: "Charmeleon"),
        Card(image: "card8", hp: 170, attack1: 170, attack2: 0, name: "Charizard"),
        Card(image: "card9", hp: 70, attack1: 20, attack2: 0, name: "Squirtle"),
        Card(image: "card10", hp: 70, attack1: 90, attack2: 0, name: "Pikachu"),
        Card(image: "card11", hp: 220, attack1: 20, attack2: 160, name: "Mewtwo"),
        Card(image: "card12", hp: 230, attack1: 60, attack2: 160, name: "Dragonite"),
        Card(image: "card13", hp: 130, attack1: 30, attack2: 0, name: "Chansey"),
        Card(image: "card14", hp: 230, attack1: 60, attack2: 160, name: "Dragonite"),
        Card(image: "card15", hp: 180, attack1: 180, attack2: 0, name: "Tyranitar"),
        Card(image: "card16", hp: 60, attack1: 30, attack2: 0, name: "Pikachu"),
        Card(image: "card17", hp: 170, attack1: 40, attack2: 110, name: "Latios"),
        Card(image: "card18", hp: 180, attack1: 80, attack2: 0, name: "Kricketune"),
        Card(image: "card19", hp: 130, attack1: 30, attack2: 90, name: "Entei"),
        Card(image: "card20", hp: 190, attack1: 10, attack2: 120, name: "Victini"),
        Card(image: "card21", hp: 140, attack1: 60, attack2: 180, name: "Electivire"),
        Card(image: "card22", hp: 210, attack1: 40, attack2: 20, name: "Tapu Koko"),
        Card(image: "card23", hp: 320, attack1: 180, attack2: 0, name: "Tapu Koko Vmax"),
        Card(image: "card24", hp: 220, attack1: 20, attack2: 100, name: "Necrozma"),
        Card(image: "card25", hp: 330, attack1: 100, attack2: 270, name: "Urshifu Vmax"),
        Card(image: "card26", hp: 220, attack1: 30, attack2: 150, name: "Urshifu"),
        Card(image: "card27", hp: 230, attack1: 60, attack2: 240, name: "Tyranitar"),
        Card(image: "card28", hp: 210, attack1: 30, attack2: 190, name: "Corviknight"),
        Card(image: "card29", hp: 230, attack1: 60, attack2: 240, name: "Tyranitar"),
        Card(image: "card30", hp: 210, attack1: 30, attack2: 190, name: "Corviknight"),
        Card(image: "card31", hp: 210, attack1: 40, attack2: 200, name: "Stoutland"),
        Card(image: "card32", hp: 60, attack1: 10, attack2: 20, name: "Turtwig"),
        Card(image: "card33", hp: 90, attack1: 10, attack2: 40, name: "Dialga"),
        Card(image: "card34", hp: 110, attack1: 80, attack2: 0, name: "Dialga Lv.X"),
        Card(image: "card35", hp: 120, attack1: 60, attack2: 0, name: "Palkia"),
        Card(image: "card36", hp: 100, attack1: 40, attack2: 0, name: "Darkrai Lv.X"),
        Card(image: "card37", hp: 70, attack1: 30, attack2: 0, name: "Dark Gengar"),
        Card(image: "card38", hp: 50, attack1: 10, attack2: 0, name: "Jigglypuff"),
        Card(image: "card39", hp: 170, attack1: 50, attack2: 0, name: "Virizion"),
        Card(image: "card40", hp: 180, attack1: 50, attack2: 80, name: "Palkia EX"),
        Card(image: "card41", hp: 180, attack1: 50, attack2: 90, name: "Dialga EX"),
        Card(image: "card42", hp: 210, attack1: 40, attack2: 140, name: "Calyrex"),
        Card(image: "card43", hp: 220, attack1: 20, attack2: 60, name: "Metagross"),
        Card(image: "card44", hp: 220, attack1: 80, attack2: 220, name: "Venusaur"),
        Card(image: "card45", hp: 220, attack1: 90, attack2: 220, name: "Incineroar"),
        Card(image: "card46", hp: 210, attack1: 20, attack2: 120, name: "Grapploct"),
        Card(image: "card47", hp: 220, attack1: 80, attack2: 220, name: "Charizard"),
        Card(image: "card48", hp: 170, attack1: 30, attack2: 100, name: "Blaziken"),
        Card(image: "card49", hp: 180, attack1: 40, attack2: 120, name: "Swampert"),
        Card(image: "card50", hp: 220, attack1: 110, attack2: 0, name: "Gallade"),
        Card(image: "card51", hp: 170, attack1: 30, attack2: 150, name: "Thundurus"),
        Card(image: "card52", hp: 180, attack1: 80, attack2: 0, name: "Hydreigon"),
        Card(image: "card53", hp: 230, attack1: 300, attack2: 0, name: "Rayquaza"),
        Card(image: "card54", hp: 180, attack1: 30, attack2: 130, name: "Rayquaza"),
    ]
    
    var effects = ["explosionType", "fire1", "fire3", "lightning"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newCardButton.isHidden = true
        attackButton.isHidden = true
        attack2Button.isHidden = true
        effectView.isHidden = true
        
    }
    

    @IBAction func playButton(_ sender: Any) {
        var randomTurnNumber = Int.random(in: 0...1)
        
        if randomTurnNumber == 0 {
            playerTurn = false
        } else {
            playerTurn = true
        }
        
        playerHP += 1000
        cpuHP += 1000
        
        cpuRandomNumber = Int.random(in: 0..<cards.count)
        playerRandomNumber = Int.random(in: 0..<cards.count)
        
        
        gameOver = false
        
        attackButton.isHidden = false
        playButton.isHidden = true
        
        playerHP += cards[playerRandomNumber].hp
        cpuHP += cards[cpuRandomNumber].hp
        
       attack2ButtonShowing()
 
        updateUI()
    }
    
    
    
    @IBAction func newCardButton(_ sender: Any) {
        playerRandomNumber = Int.random(in: 0..<cards.count)
        playerImage.image = UIImage(named: cards[playerRandomNumber].image)
        
        cpuRandomNumber = Int.random(in: 0..<cards.count)
        cpuImage.image = UIImage(named: cards[cpuRandomNumber].image)
        
        if cards[playerRandomNumber].attack2 == 0 {
            attack2Button.isHidden = true
        } else {
            attack2Button.isHidden = false
        }
        attack2ButtonShowing()
    }
    
    
    @IBAction func attackButton(_ sender: Any) {
        
        attackButtonPresses += 1
        
        // CPU randomly select Attack 1 or 2
        if cards[cpuRandomNumber].attack2 == 0 {
            playerHP -= cards[cpuRandomNumber].attack1
            
        } else {
            let randomNumber = Int.random(in: 0...1)
            if randomNumber == 0 {
                playerHP -= cards[cpuRandomNumber].attack1
                
            } else {
                playerHP -= cards[cpuRandomNumber].attack2
            }
        }

        cpuHP -= cards[playerRandomNumber].attack1
        
        if playerHP < 300 || attackButtonPresses % 3 == 0 {
            newCardButton.isHidden = false
        } else {
            newCardButton.isHidden = true
        }
        
        
        if playerHP < 1 {
            loses += 1
            performSegue(withIdentifier: "lose", sender: nil)
        } else if cpuHP < 1 {
            wins += 1
            performSegue(withIdentifier: "win", sender: nil)
        }
        
        // Add the effect and remove after 0.4 sec.
        effectView.image = UIImage(named: effects[Int.random(in: 0..<effects.count)])
        
        effectView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.effectView.isHidden = true
        }
        
        attack2ButtonShowing()
        
      
        
        updateUI()
        
        
    }
    
    
    @IBAction func attack2Button(_ sender: Any) {
        attackButtonPresses += 1
        
        // CPU randomly select Attack 1 or 2
        if cards[cpuRandomNumber].attack2 == 0 {
            playerHP -= cards[cpuRandomNumber].attack1
            
        } else {
            let randomNumber = Int.random(in: 0...1)
            if randomNumber == 0 {
                playerHP -= cards[cpuRandomNumber].attack1
                
            } else {
                playerHP -= cards[cpuRandomNumber].attack2
            }
        }
        
        cpuHP -= cards[playerRandomNumber].attack2
        
        
        if playerHP < 300 || attackButtonPresses % 3 == 0 {
            newCardButton.isHidden = false
        } else {
            newCardButton.isHidden = true
        }
        
        
        if playerHP < 1 {
            loses += 1
            performSegue(withIdentifier: "lose", sender: nil)
        } else if cpuHP < 1 {
            wins += 1
            performSegue(withIdentifier: "win", sender: nil)
        }
        
        effectView.image = UIImage(named: effects[Int.random(in: 0..<effects.count)])
        
        effectView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.effectView.isHidden = true
        }
        
        attack2ButtonShowing()
     
        
        updateUI()
    }
    
    
    var labelPositionisLeft = true
    
    func updateUI() {
        cpuImage.image = UIImage(named: cards[cpuRandomNumber].image)
        playerImage.image = UIImage(named: cards[playerRandomNumber].image)
        playerScoreLabel.text = "PLAYER: \(playerHP)"
        cpuScoreLabel.text = "ENEMY: \(cpuHP)"
        
        
        // Color the Score Label text
        if playerHP < 150 {
            playerScoreLabel.textColor = UIColor.red
        } else if playerHP < 300 {
            playerScoreLabel.textColor = UIColor.yellow
        }
        
        if cpuHP < 150 {
            cpuScoreLabel.textColor = UIColor.red
        } else if cpuHP < 300 {
            cpuScoreLabel.textColor = UIColor.yellow
        }
        
      
        
        
        
    }
    
    
    func attack2ButtonShowing() {
        // Work about to show or hide attack 2 Button
        if cards[playerRandomNumber].attack2 == 0 {
            attack2Button.isHidden = true
        } else {
            // Add a chance for Attack 2 button to show or not.
            let randomNumber = Int.random(in: 0...1)
            if randomNumber == 0 {
                attack2Button.isHidden = false
            } else {
                attack2Button.isHidden = true
            }
        }
    }
    
    
    
}

