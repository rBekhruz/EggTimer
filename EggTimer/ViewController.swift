//
//  ViewController.swift
//  EggTimer
//
//  Created by Bekhruz Ramazonov on 10/01/2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var player: AVAudioPlayer!
        
    @IBOutlet weak var doneText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        
        let totalTime = eggTimes[hardness!]
        
        if (hardness == "Soft") {
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.eggTimes["Soft"]! > 0 {
                    print ("\(self.eggTimes["Soft"]!) seconds")
                    self.eggTimes["Soft"]! -= 1
                    
                    self.progressBar.progress -= 0.003
                } else {
                    Timer.invalidate()
                    
                    self.doneText.text = "DONE!!!"
                    
                    self.playSound(soundName: "alarm_sound")
                    
                    self.progressBar.progress = 1
                }
            }
            
        } else if (hardness == "Medium") {
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.eggTimes["Medium"]! > 0 {
                    print ("\(self.eggTimes["Medium"]!) seconds")
                    self.eggTimes["Medium"]! -= 1
                    
                    self.progressBar.progress -= 0.002
                } else {
                    Timer.invalidate()
                    
                    self.doneText.text = "DONE!!!"
                    
                    self.playSound(soundName: "alarm_sound")
                    
                    self.progressBar.progress = 1
                }
            }
            
        } else if (hardness == "Hard") {
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.eggTimes["Hard"]! > 0 {
                    print ("\(self.eggTimes["Hard"]!) seconds")
                    self.eggTimes["Hard"]! -= 1
                    
                    self.progressBar.progress -= 0.001
                } else {
                    Timer.invalidate()
                    
                    self.doneText.text = "DONE!!!"
                    
                    self.playSound(soundName: "alarm_sound")
                    
                    self.progressBar.progress = 1
                }
            }
            
        }
    }
    
    func playSound(soundName: String) {
        
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
