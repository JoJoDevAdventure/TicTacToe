//
//  ViewController.swift
//  TicTacToe
//
//  Created by Youssef Bhl on 10/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK : Propreties
    var player1Score = 0
    var player2Score = 0
    
    var noWinner = false
    var player1 = false
    var player2 = true
    var buttons: [Bool] = {
        var array = [Bool]()
        
        for _ in 0...8 {
            array.append(false)
        }
        
       return array
    }()
    
    var filledAray: [Int] = {
        var array = [Int]()
        
        for _ in 0...8 {
            array.append(0)
        }
        
       return array
    }()
    
    
    
    
    // MARK : Outlets
    
        // Les bouttons
    @IBOutlet weak var boutton1: UIButton!
    @IBOutlet weak var boutton2: UIButton!
    @IBOutlet weak var boutton3: UIButton!
    @IBOutlet weak var boutton4: UIButton!
    @IBOutlet weak var boutton5: UIButton!
    @IBOutlet weak var boutton6: UIButton!
    @IBOutlet weak var boutton7: UIButton!
    @IBOutlet weak var boutton8: UIButton!
    @IBOutlet weak var boutton9: UIButton!
    
    @IBOutlet weak var RestartGameView: UIView!
    @IBOutlet weak var WinnerLabel: UILabel!
    @IBOutlet weak var WinnerIMG: UIImageView!
    @IBOutlet weak var RestartButton: UIButton!
    @IBOutlet weak var ScorePlayer1: UILabel!
    @IBOutlet weak var ScorePlayer2: UILabel!
    @IBOutlet weak var RestartScores: UIButton!
    @IBOutlet weak var NulIMG: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
        WinnerIMG.isHidden = true
        NulIMG.isHidden = true
        WinnerLabel.isHidden = true
        RestartGameView.isHidden = true

        
    }
    
    @IBAction func RestartGame(_ sender: Any) {
        RestartGameView.isHidden = true
        for tag in 0...8 {
            buttons[tag]=false}
        boutton1.setBackgroundImage ( UIImage(named:""), for: .normal )
        boutton2.setBackgroundImage ( UIImage(named:""), for: .normal )
        boutton3.setBackgroundImage ( UIImage(named:""), for: .normal )
        boutton4.setBackgroundImage ( UIImage(named:""), for: .normal )
        boutton5.setBackgroundImage ( UIImage(named:""), for: .normal )
        boutton6.setBackgroundImage ( UIImage(named:""), for: .normal )
        boutton7.setBackgroundImage ( UIImage(named:""), for: .normal )
        boutton8.setBackgroundImage ( UIImage(named:""), for: .normal )
        boutton9.setBackgroundImage ( UIImage(named:""), for: .normal )
        WinnerIMG.image = UIImage(named: "")
        WinnerIMG.isHidden = true
        WinnerLabel.isHidden = true
        WinnerLabel.text = "GAGNE !"
        
        for h in 0...8 {
            filledAray[h]=0
        }
        noWinner = false
        NulIMG.isHidden = true
        

    }
    
    @IBAction func RestartScorees(_ sender: Any) {
        player1Score = 0
        player2Score = 0
        ScorePlayer1.text = "\(player1Score)"
        ScorePlayer2.text = "\(player2Score)"
    }
    
    
    
    
    @IBAction func ButtonWasClicked(_ sender: UIButton) {
        
        if buttons[sender.tag] == false {
            
            if player1 == true && player2 == false {
                setBox(button: sender, forPlayer: 1)
                filledAray[sender.tag] = 1
                buttons[sender.tag] = true
                
            }else if player1 == false && player2 == true {
                setBox(button: sender, forPlayer: 2)
                filledAray[sender.tag] = 2
                buttons[sender.tag] = true
                
            }else {
                print("Erreur : les deux joueurs ne peuvent pas jouer au même temps")
            }
            
            // Définition du gagnant
    
            if let winner = testWinner() {
                if buttons[0] == true && buttons[1] == true && buttons[2] == true && buttons[3] == true && buttons[4] == true && buttons[5] == true && buttons[6] == true && buttons[7] == true && buttons[8] == true  {
                    noWinner = true
                    
                }
                    if winner == 1 {
                        WinnerIMG.image = UIImage(named: "crois")
                        WinnerIMG.isHidden = false
                        WinnerLabel.isHidden = false
                        RestartGameView.isHidden = false
                        player1Score = player1Score + 1
                        ScorePlayer1.text = "\(player1Score)"
                        ScorePlayer2.text = "\(player2Score)"
                            
                    }else if winner == 2 {
                        WinnerIMG.image = UIImage(named: "rond")
                        WinnerIMG.isHidden = false
                        WinnerLabel.isHidden = false
                        RestartGameView.isHidden = false
                        player2Score = player2Score + 1
                        ScorePlayer1.text = "\(player1Score)"
                        ScorePlayer2.text = "\(player2Score)"
                        
                    }else if winner == 0 && noWinner == true{
                        NulIMG.isHidden = false
                        RestartGameView.isHidden = false
                    }
            
        }else{
            
            print("Impossible de remplir la même case deux fois")
        }
            
        }
        
    }
    
    
    
    //MARK : Privat functions

    
    
    private func setBox(button : UIButton, forPlayer player : Int) {
        if player == 1 {
            button.setBackgroundImage ( UIImage(named: "crois"), for: .normal )
            player1 = false
            player2 = true
        } else if player == 2 {
            button.setBackgroundImage ( UIImage(named: "rond"), for: .normal )
            player1 = true
            player2 = false
        } else {
            print("Erreur : le joueur \(player) n'existe pas.")
        }
        
    }
    
    private func setOffButton() {
        
    }
    
    private func testWinner() -> Int? {
        var winner = 0
        
        // gagnant par ligne horizentale
        
        if filledAray[0] != 0 && filledAray[0] == filledAray[1] && filledAray[1] == filledAray [2] {
            winner = filledAray[0]
        } 
        
        if filledAray[3] != 0 && filledAray[3] == filledAray[4] && filledAray[4] == filledAray [5] {
            winner = filledAray[3]
        }
        
        if filledAray[6] != 0 && filledAray[6] == filledAray[7] && filledAray[7] == filledAray [8] {
            winner = filledAray[6]
        }
        
        // gagnant par ligne verticale
        
        if filledAray[0] != 0 && filledAray[0] == filledAray[3] && filledAray[3] == filledAray [6] {
            winner = filledAray[0]
        }
        
        if filledAray[1] != 0 && filledAray[1] == filledAray[4] && filledAray[4] == filledAray [7] {
            winner = filledAray[1]
        }
        
        if filledAray[2] != 0 && filledAray[2] == filledAray[5] && filledAray[5] == filledAray [8] {
            winner = filledAray[2]
        }
        
        // gagnant par diagonale
        
        if filledAray[0] != 0 && filledAray[0] == filledAray[4] && filledAray[4] == filledAray [8] {
            winner = filledAray[0]
        }
        
        if filledAray[2] != 0 && filledAray[2] == filledAray[4] && filledAray[4] == filledAray [6] {
            winner = filledAray[2]
        }
        
        
        return winner
        
    }
    
    func buttonSetup(){
        RestartButton.backgroundColor = .clear
        RestartButton.layer.cornerRadius = 20
        RestartButton.layer.borderWidth = 4
        RestartButton.layer.borderColor = UIColor.systemPurple.cgColor
        
        RestartGameView.layer.borderWidth = 3
        RestartGameView.layer.borderColor = UIColor.systemPurple.cgColor
        
        RestartScores.backgroundColor = .clear
        RestartScores.layer.cornerRadius = 20
        RestartScores.layer.borderWidth = 4
        RestartScores.layer.borderColor = UIColor.systemYellow.cgColor
        
    }
    

}
