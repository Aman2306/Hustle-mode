//
//  ViewController.swift
//  Hustle-mode
//
//  Created by Aman Meena on 20/03/19.
//  Copyright © 2019 Aman Meena. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // Properties
    /***************************************************************************/
    var player: AVAudioPlayer!
    
    // Outlets
    /***************************************************************************/
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var rockAndSteamImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var againButton: UIButton!
    
    // Actions
    /***************************************************************************/
    @IBAction func powerButtonTapped(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        animateRocket()
    }
    @IBAction func againTapped(_ sender: Any) {
        changeUI()
        self.rockAndSteamImage.frame = CGRect(x: -14, y: 368, width: 414, height: 424)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeUI()
        configureAVPlayers()
    }
    
    private func configureAVPlayers() {
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    private func changeUI() {
        darkBlueBG.isHidden = false
        powerButton.isHidden = false
        cloudHolder.isHidden = true
        againButton.isHidden = false
    }
    
    private func animateRocket() {
        UIView.animate(withDuration: 2.3, animations: {
            self.rockAndSteamImage.frame = CGRect(x: 0, y: 140, width: 414, height: 424)
        }) { (finished) in
            self.hustleLabel.isHidden = false
            self.label.isHidden = false
        }
    }
}

