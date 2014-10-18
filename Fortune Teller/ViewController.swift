//
//  ViewController.swift
//  Fortune Teller
//
//  Created by Chris Snyder on 10/17/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()

    var fortunes = ["you will be rich", "you will be poor", "you will be happy", "you will be famous"]
    @IBOutlet weak var fortuneLabel: UILabel!
    @IBOutlet weak var buttonPressed: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: UIButton)
    {
        var randomNumber = Int(arc4random_uniform(UInt32(fortunes.count)))

        fortuneLabel.text = fortunes[randomNumber]
        view.backgroundColor = UIColor.blueColor()

        let fileLocation = NSString(string: NSBundle.mainBundle().pathForResource("belch", ofType: "mp3")!)

        var error:NSError? = nil

        player = AVAudioPlayer(contentsOfURL: NSURL(string: fileLocation), error: &error)
        player.play()
    }

}

