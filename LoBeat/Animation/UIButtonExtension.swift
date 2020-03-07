//
//  UIButtonExtension.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2020-03-07.
//  Copyright © 2020 Caweh Passereh. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.duration = 0.1
        pulse.fromValue = 0.9
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.initialVelocity = 0.5
        pulse.damping = 0
        
        layer.add(pulse, forKey: nil)
    }
    
    
    
}
