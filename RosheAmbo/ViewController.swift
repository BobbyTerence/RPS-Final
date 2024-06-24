//
//  ViewController.swift
//  RosheAmbo
//
//  Created by Will Flowers and Seth Prenger
//

import UIKit

class ViewController: UIViewController {
    // Outlets to rotate images
    @IBOutlet var rockCard: UIImageView!
    @IBOutlet var paperCard: UIImageView!
    
    // Outlets to visually show Game state
    @IBOutlet var roundScr: UILabel!
    @IBOutlet var atScore: UILabel!
    @IBOutlet var compCard: UIImageView!
    @IBOutlet var rndOutcome: UILabel!
    
    //Create a game state object
    var currentGame: Game!
    
    // Create a varaible to store player wins and losses
    var playerWins: Int = 0
    var playerLosses: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Rotate Images
        rotateImageView(rockCard, byAngle: -(.pi / 4))
        rotateImageView(paperCard, byAngle: .pi / 4)
        // Do any additional setup after loading the view.
        newGame() // Create a new game
    }
    
    // Function to provide logic to transform an image by a given angle
    func rotateImageView(_ imageView: UIImageView, byAngle angle: CGFloat) {
        let rotationTransform = CGAffineTransform(rotationAngle: angle)
        imageView.transform = rotationTransform
    }
    
    //Create a new game
    func newGame() {
        currentGame = Game(playerChoice: 0, playerWin: 0, compChoice: 0, compWin: 0)
        updateUI()
    }
    
    //Update the UI
    func updateUI() {
        roundScr.text = "Player: \(currentGame.playerWin)    Computer: \(currentGame.compWin)"
        rndOutcome.text = currentGame.rndOutcome
    }
    
    /*
     * The Action connections for each button will be used for calling various functions
     * checking for game state
     */
    @IBAction func rock(_ sender: Any) {
        currentGame.playerChoice = 1
        playgame()
    }
    
    @IBAction func paper(_ sender: Any) {
        currentGame.playerChoice = 2
        playgame()
    }
    
    @IBAction func scissors(_ sender: Any) {
        currentGame.playerChoice = 3
        playgame()
    }
    
    /*
     * The function compChoice will generate a random number for the computer's choice and then
     * call functions to update game state
     */
    func playgame() {
        currentGame.compChoice = Int.random(in: 1..<4) // Creates a random number between 1 and 3
        
        compCard.image = UIImage(named: "\(currentGame.showComp)")
        checkState()
    }
    
    // Checks the game state after an input
    func checkState() {
        /*
         * Some notes for checking game state:
         *
         *      Rock = 1
         *      Paper = 2
         *      Scissors = 3
         *
         * I am open adding more options at some point, but probably not for the purpose of turning in something clean for the final
         */
        if(currentGame.playerChoice == 1){
            switch(currentGame.compChoice) {
            case 1:
                currentGame.rndOutcome = "Tie"
                break;
            case 2:
                currentGame.rndOutcome = "Ha ha!!! You lost!!!"
                currentGame.compWin += 1
                break;
            case 3:
                currentGame.rndOutcome = "Darn, you took this one!"
                currentGame.playerWin += 1
                break;
            default:
                break;
            }
            
            if(currentGame.playerWin == 2 || currentGame.compWin == 2) {
                bestOfThree()
            }
            
            updateUI()
        } else if(currentGame.playerChoice == 2){
            switch(currentGame.compChoice) {
            case 1:
                currentGame.rndOutcome = "Darn, you took this one!"
                currentGame.playerWin += 1
                break;
            case 2:
                currentGame.rndOutcome = "Tie"
                break;
            case 3:
                currentGame.rndOutcome = "Ha ha!!! You lost!!!"
                currentGame.compWin += 1
                break;
            default:
                break;
            }
            
            if(currentGame.playerWin == 2 || currentGame.compWin == 2) {
                bestOfThree()
            }
            
            updateUI()
        } else if(currentGame.playerChoice == 3){
            switch(currentGame.compChoice) {
            case 1:
                currentGame.rndOutcome = "Ha ha!!! You lost!!!"
                currentGame.compWin += 1
                break;
            case 2:
                currentGame.rndOutcome = "Darn, you took this one!"
                currentGame.playerWin += 1
                break;
            case 3:
                currentGame.rndOutcome = "Tie"
                break;
            default:
                break;
            }
            
            if(currentGame.playerWin == 2 || currentGame.compWin == 2) {
                bestOfThree()
            }
            
            updateUI()
        }
    }
    
    func bestOfThree() {
        if(currentGame.playerWin == 2) {
            playerWins += 1
            atScore.text = "Wins: \(playerWins) Loses: \(playerLosses)"
            newGame()
        } else if(currentGame.compWin == 2) {
            playerLosses += 1
            atScore.text = "Wins: \(playerWins) Loses: \(playerLosses)"
            newGame()
        }
    }
}

