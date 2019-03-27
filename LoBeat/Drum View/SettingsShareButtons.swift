//
//  SettingsShareButtons.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2019-03-25.
//  Copyright © 2019 Caweh Passereh. All rights reserved.
//

import Foundation
import UIKit

class SettingsShareButtons {
    
    
    func createSettingsShareButtons(view: UIView) -> [UIButton] {
        
        
        let settingsButton = UIButton()
        let shareButton = UIButton()
        var shareSettingsButtons = [UIButton]()
        
        let screenWidth = view.frame.width
        let screenHeight = view.frame.height
        
        shareSettingsButtons.append(contentsOf: [settingsButton, shareButton])
        
        settingsButton.setImage(UIImage(named: "App Button Icons/settings"), for: .normal)
        shareButton.setImage(UIImage(named: "App Button Icons/share"), for: .normal)
        
        settingsButton.frame = CGRect(x: 16, y: screenHeight/2 - 48, width: screenWidth/10, height: screenWidth/10)
        shareButton.frame = CGRect(x: screenWidth - 48, y: screenHeight/2 - 48, width: screenWidth/10, height: screenWidth/10)
        
        settingsButton.addTarget(self, action: #selector(DrumController.shareOptionsPressed(_:)), for: .touchDown)
        shareButton.addTarget(self, action: #selector(DrumController.shareOptionsPressed(_:)), for: .touchDown)
        
        
        view.addSubview(settingsButton)
        view.addSubview(shareButton)
        
        settingsButton.tag = 0
        shareButton.tag = 1
        
        return shareSettingsButtons
        
        
    }
    
    
}
