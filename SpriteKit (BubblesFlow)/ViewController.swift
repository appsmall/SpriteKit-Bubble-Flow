//
//  ViewController.swift
//  SpriteKit (BubblesFlow)
//
//  Created by Shashank Panwar on 26/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    var scene: AnimationScene!
    var size: CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        size = self.view.frame.size
        scene = AnimationScene(size: size)
        
        let skView = self.view as! SKView
        skView.presentScene(scene)
    }

}

