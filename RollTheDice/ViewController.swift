//
//  ViewController.swift
//  RollTheDice
//
//  Created by Deepankar D on 30/05/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var turn = 1 // 1 for player 1 and 2 for player 2
    var dice = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    var isRed = false
    var progressBarTimer: Timer!
    var isRunning = false
    
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var playerLabel: UILabel!
    
    @IBOutlet weak var dice1ImageView: UIImageView!
    @IBOutlet weak var dice2ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.0
 
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        switch turn {
        case 1: dice1ImageView.image = dice.randomElement()
        turn = 2
        sender.isEnabled = false
        case 2:  dice2ImageView.image = dice.randomElement()
        turn = 1
            sender.isEnabled = false
        default: print("Not a valid player")
        }
        progressBar() 
        
    }
    
    func progressBar(){
        
        if(isRunning){
            progressBarTimer.invalidate()
        }
        else{
            progressView.progress = 0.0
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.updateProgressView), userInfo: nil, repeats: true)
            if(isRed){
                progressView.progressTintColor = UIColor.blue
                progressView.progressViewStyle = .default
            }
            else{
                progressView.progressTintColor = UIColor.red
                progressView.progressViewStyle = .bar
                
            }
            isRed = !isRed
            
        }
        isRunning = !isRunning
    }
    
    @objc func updateProgressView(){
        progressView.progress += 0.1
        progressView.setProgress(progressView.progress, animated: true)
        if(progressView.progress == 1.0)
        {
            progressBarTimer.invalidate()
            isRunning = false
            if turn == 1 {
                self.playerLabel.text = "Turn: Player 1"
                progressView.progress = 0.0
            }else if turn == 2{
                self.playerLabel.text = "Turn: Player 2"
                progressView.progress = 0.0
            }
            rollButton.isEnabled = true
            //   timerLabel.text = "Start"
        }
    }

    //        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
    //            self.playerLabel.text = "Player 1"
    //
    
}

