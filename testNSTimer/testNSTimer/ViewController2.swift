//
//  ViewController2.swift
//  testNSTimer
//
//  Created by Sergey Mikhailov on 03.02.2020.
//  Copyright © 2020 Sergey Mikhailov. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if timer.isValid {
            timer.invalidate()
        }
    }
    
    @objc func update() {
        print("tik-tak")
    }
}
