//
//  DrumButton.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2019-03-14.
//  Copyright © 2019 Caweh Passereh. All rights reserved.
//

import UIKit
import Foundation

class DrumButton : UIView {
    
    var drumPad = UIButton()
    var drumPadCollection = [UIButton]()
    
    var tagIndex = 0
    
    let rows = 4
    let columns = 4
    let spacer = 8
    
    func createDrumPadCollection(view : UIView) -> [UIButton] {
        
        let screenWidth = Int(view.frame.width)
        let screenHeight = Int(view.frame.height)
        
        for i in 0..<rows {
            
            for j in 0..<columns {
                
                let drumXPosition = i * (screenWidth/rows)
                let drumYPosition = j * (screenHeight/2/columns)
                
                drumPad = UIButton(type: .custom)
                
                drumPad.layer.borderWidth = 3
                drumPad.layer.borderColor = UIColor.white.cgColor
                drumPad.layer.cornerRadius = 25.0
                
                drumPad.frame = CGRect(x: drumXPosition + spacer, y: drumYPosition + spacer + screenHeight/2, width: screenWidth/rows - spacer, height: (screenHeight/2)/columns - spacer)
                
                drumPad.addTarget(self, action: #selector(DrumController.drumButtonTapped(_:)), for: .touchDown)
                
                drumPad.tag = tagIndex
                tagIndex += 1
                
                drumPadCollection.append(drumPad)
                
                view.addSubview(drumPad)
                
            }
            
        }
        
        return drumPadCollection
        
    }
    
}

