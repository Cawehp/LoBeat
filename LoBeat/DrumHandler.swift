//
//  DrumHandler.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2019-03-21.
//  Copyright © 2019 Caweh Passereh. All rights reserved.
//

//import Foundation
//import AudioKit
//
//class DrumHandler {
//    
//    let drumSounds = [
//        "sample1",
//        "sample2",
//        "sample3",
//        "sample4",
//        "sample5",
//        "sample6",
//        "sample7",
//        "sample8",
//        "sample9",
//        "sample10",
//        "sample11",
//        "sample12",
//        "sample13",
//        "sample14",
//        "sample15",
//        "sample16"
//    ];
//    
//    func playSample(senderTag : Int) {
//        
//        let sampleHolder = "Sound Bank/\(drumSounds[senderTag]).mp3"
//        
//        do {
//            let sample = try AKAudioFile(readFileName: sampleHolder, baseDir: .resources)
//            let player = try AKAudioPlayer(file: sample)
//            mixer.connect(input: player)
//            player.play()
//        } catch {
//            print("Sample not loaded")
//        }
//        
//    }
//    
//    
//}
