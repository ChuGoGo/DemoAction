//
//  ViewController.swift
//  Demo Action
//
//  Created by Chu Go-Go on 2021/12/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var talkTextField: UITextField!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var nose: UILabel!
    @IBOutlet weak var bugs: UILabel!
    @IBOutlet weak var leftEye: UILabel!
    @IBOutlet weak var righteye: UILabel!
    
//    ่จญๅฎไฝ ็Array
    let noseColors = ["๐๐ป", "๐", "๐๐ฟ"]
    var index: Int = 0
//    ่จญๅฎ่่็็งปๅ่งๅบฆ
    func bugslocation(degrees: CGFloat) {
        bugs.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi / 180 * degrees).translatedBy(x: 0, y: -150)
        valueLabel.text = "\(Int(degrees))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func speak(_ sender: Any) {
        let utterance =  AVSpeechUtterance(string: talkTextField.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    @IBAction func Move(_ sender: UISlider) {
        leftEye.transform = CGAffineTransform(translationX: CGFloat(10 + 0.4 * sender.value), y: 0)
        righteye.frame.origin.x = CGFloat(270 - 0.4 * sender.value)
        bugslocation(degrees: CGFloat(sender.value))
    }
    @IBAction func noseColor(_ sender: UISegmentedControl) {
        nose.text = noseColors[index]
        index = ( index + 1 ) % 3
    }
    
}

