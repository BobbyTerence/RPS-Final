//
//  Game.swift
//  RosheAmbo
//
//  Created by Will Flowers and Seth Prenger
//

import Foundation

struct Game {
    // Player Variables
    var playerChoice: Int
    var playerWin: Int
    var compChoice: Int
    var compWin: Int
    
    // Round Variables
    var rndOutcome: String = "Hey you there! Lets play roshambo!!!" // Value used to show what the outcome of the round is
    
    var showComp: String {
        var imgStr: String = " "
        switch(compChoice) {
        case 1:
            imgStr = "rock"
            break;
        case 2:
            imgStr = "paper"
            break;
        case 3:
            imgStr = "scissors"
            break;
        default:
            break;
        }
        
        return(imgStr);
    }
}
