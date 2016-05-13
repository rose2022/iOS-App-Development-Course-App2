//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Rosemary Espinal on 5/10/16.
//  Copyright © 2016 Rosemary Espinal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //My outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    //My variables
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //starting the game
    @IBAction func onPlayButtonPressed(sender: UIButton!){
        
        //check to see if the text box has a value, if it does set that has the max number of taps
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != ""
        {
            //hide
            logoImage.hidden = true
            playButton.hidden = true
            howManyTapsTxt.hidden = true
            
            //show
            tapButton.hidden = false
            tapsLabel.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)! //grabs text out of text field and converts it to integer
            currentTaps = 0
            
            updateTapsLabel()
        }
    }
    
    //action when coin is tapped
    @IBAction func onCoinTapped(sender: UIButton!){
        
        currentTaps++; //increase number of taps
        updateTapsLabel() //update label
        
        //check to see if the game is over
        if(isGameOver()){
            restartGame()
        }
        
    }
    
    func updateTapsLabel(){
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool{
        if (currentTaps >= maxTaps){
            return true
        } else {
            return false
        }
    }
    
    func restartGame(){
        maxTaps = 0 //reset maxtaps
        howManyTapsTxt.text = "" //reset taps text string
        
        //show
        logoImage.hidden = false
        playButton.hidden = false
        howManyTapsTxt.hidden = false
        
        //hide
        tapButton.hidden = true
        tapsLabel.hidden = true
    }
}

