//
//  ViewController.swift
//  ICE1
//
//  Created by Abdelrahman  Tealab on 2021-01-31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerBetLabel: UILabel!
    @IBOutlet weak var creditsText: UILabel!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var middleImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    var betLine = [" ", " ", " "]
    var grapes = 0
    var bananas = 0
    var oranges = 0
    var cherries = 0
    var bars = 0
    var bells = 0
    var sevens = 0
    var blanks = 0
    
    var playerMoney = 1000
    var winnings = 0
    var jackpot = 5000
    var playerBet = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - change bet
    
    @IBAction func betChanged(_ sender: UIStepper) {
        playerBet = Int(sender.value)
        playerBetLabel.text = String(playerBet)
    }
    
    //MARK: - spin button
    @IBAction func spin(_ sender: UIButton) {
        spinReels()

        leftImage.image = UIImage(named: betLine[0])
        middleImage.image = UIImage(named: betLine[1])
        rightImage.image = UIImage(named: betLine[2])
        
        determineWinnings()
    }
    //MARK: - spin reels
    func spinReels() -> [String] {
        var outCome = [0, 0, 0];
        
        for spin in 0...2 {
            outCome[spin] = Int(floor((Double.random(in: 1...65))))
            if outCome[spin] >= 1 && outCome[spin] <= 27 {
                betLine[spin] = "Blank"
                blanks+=1
            }
            else if outCome[spin] >= 28 && outCome[spin] <= 37{
                betLine[spin] = "Grapes";
                grapes+=1
            }
            else if outCome[spin] >= 38 && outCome[spin] <= 46{
                betLine[spin] = "Banana";
                bananas+=1
            }
            else if outCome[spin] >= 47 && outCome[spin] <= 54{
                betLine[spin] = "Orange";
                oranges+=1
            }
            else if outCome[spin] >= 55 && outCome[spin] <= 59{
                betLine[spin] = "Cherry";
                cherries+=1
            }
            else if outCome[spin] >= 60 && outCome[spin] <= 62{
                betLine[spin] = "Bar";
                bars+=1
            }
            else if outCome[spin] >= 63 && outCome[spin] <= 64{
                betLine[spin] = "Bell";
                bells+=1
            }
            else if outCome[spin] >= 65 && outCome[spin] <= 65{
                betLine[spin] = "Seven";
                sevens+=1
            }
               
        }
        return betLine;
    }
    //MARK: - determine winnnings
    func determineWinnings() {
        if (blanks == 0) {
            if (grapes == 3) {
                winnings = playerBet * 10
            }
            else if (bananas == 3) {
                winnings = playerBet * 20
            }
            else if (oranges == 3) {
                winnings = playerBet * 30
            }
            else if (cherries == 3) {
                winnings = playerBet * 40
            }
            else if (bars == 3) {
                winnings = playerBet * 50
            }
            else if (bells == 3) {
                winnings = playerBet * 75
            }
            else if (sevens == 3) {
                winnings = playerBet * 100
            }
            else if (grapes == 2) {
                winnings = playerBet * 2
            }
            else if (bananas == 2) {
                winnings = playerBet * 2
            }
            else if (oranges == 2) {
                winnings = playerBet * 3
            }
            else if (cherries == 2) {
                winnings = playerBet * 4
            }
            else if (bars == 2) {
                winnings = playerBet * 5
            }
            else if (bells == 2) {
                winnings = playerBet * 10
            }
            else if (sevens == 2) {
                winnings = playerBet * 20
            }
            else if (sevens == 1) {
                winnings = playerBet * 5
            }
            else {
                winnings = playerBet * 1
            }
            print("Win!")
        }
        else {
            print("Loss!")
        }
        resultText.text = String(winnings)
        playerMoney += winnings
        creditsText.text = String(playerMoney)
        resetFruitTally()
    }

    func resetFruitTally() {
        grapes = 0
        bananas = 0
        oranges = 0
        cherries = 0
        bars = 0
        bells = 0
        sevens = 0
        blanks = 0
    }
}
    


