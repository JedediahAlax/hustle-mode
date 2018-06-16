//
//  ViewController.swift
//  hustle-mode
//
//  Created by Jedediah Alax on 6/15/18.
//  Copyright © 2018 Jedediah Alax. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Create varaibles to link up UI elements to code
    @IBOutlet weak var darkBlueBG: UIImageView!             // Dark blue background image
    @IBOutlet weak var powerButton: UIButton!               // Power button image
    @IBOutlet weak var cloudHolder: UIView!                 // CloudHolder UIView
    @IBOutlet weak var rocket: UIImageView!                 // Rocket image
    @IBOutlet weak var hustleOnLabel: UILabel!              // Hustle Mode label
    @IBOutlet weak var onLabel: UILabel!                    // On label
    
    // Vartiable for audio player to play sound
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a path for the sound wav file
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        
        // Use the path to create URL for sound wav file
        let url = URL(fileURLWithPath: path)
        
        // Use do catch in case file can not be found
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            
        } catch let error as NSError {
            print(error.description)                        // will print error if can't find wav file
        }
    }
    
    

    // Power botton pressed function
    @IBAction func powerButtonPressed(_ sender: Any) {
        
        // Unhide/Hide UI elements when button is pressed
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        // Play sound from wav file
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 260, width: 375, height: 160)
        }) { (finished) in
            self.hustleOnLabel.isHidden = false
            self.onLabel.isHidden = false
        
        
    }
    
}

}

