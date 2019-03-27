//
//  TopButtons.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2019-03-14.
//  Copyright © 2019 Caweh Passereh. All rights reserved.
//

import Foundation
import UIKit

class TopButtons : UIView  {
    
    var topButtons = [UIButton]()
    var recordTrackButton = UIButton()
    var recordPadButton = UIButton()
    var playButton = UIButton()
    var stopButton = UIButton()
    
    var redRecordTrackButtonImage = UIImage()
    var redRecordPadButtonImage = UIImage()
    var greenPlayButtonImage = UIImage()
    
    var recordTrackButtonImage = UIImage()

    var recordPadButtonImage = UIImage()

    var playButtonImage = UIImage()
    
    var stopButtonImage = UIImage()
    var imageArray = [UIImage]()
    
    var tempButton = UIButton()
    var tagIndex = 0
    
    func getImages() -> [UIImage]{
        
        recordTrackButtonImage = UIImage(named: "App Button Icons/recordTrack")!
        recordPadButtonImage = UIImage(named: "App Button Icons/recordPad")!
        playButtonImage = UIImage(named: "App Button Icons/play")!
        stopButtonImage = UIImage(named: "App Button Icons/stop")!
        
        redRecordTrackButtonImage = UIImage(named: "App Button Icons/redRecordTrack")!
        redRecordPadButtonImage = UIImage(named: "App Button Icons/redRecordPad")!
        greenPlayButtonImage = UIImage(named: "App Button Icons/greenPlay")!
        
        imageArray.append(contentsOf: [recordTrackButtonImage,
                                       recordPadButtonImage,
                                       playButtonImage,
                                       stopButtonImage,
                                       redRecordTrackButtonImage,
                                       redRecordPadButtonImage,
                                       greenPlayButtonImage])
        
        topButtons.append(contentsOf: [recordTrackButton,
                                       recordPadButton,
                                       playButton,
                                       stopButton])
        
        return imageArray
        
    }
    
    func createTopButtons(view: UIView) -> [UIButton] {
        
        _ = getImages()
        
        let screenWidth = Int(view.frame.width)
        let screenHeight = Int(view.frame.height)
        let spacer = 8
        let numberOfIcons = Int(topButtons.count)
        
        for i in 0..<numberOfIcons {
            
            tempButton = topButtons[i]
                
            tempButton.frame = CGRect(x: (screenWidth/numberOfIcons * Int(i)) + spacer, y: screenHeight/25, width: screenWidth/numberOfIcons - spacer, height: screenWidth/numberOfIcons - spacer)
                
            tempButton.addTarget(self, action: #selector(DrumController.topButtonPressed(_:)), for: .touchDown)
                
            tempButton.setImage(imageArray[i], for: .normal)
                
            tempButton.tag = tagIndex
                
            tagIndex += 1
            
            view.addSubview(tempButton)
            //asds
        }

        return topButtons
        
    }
    
}
