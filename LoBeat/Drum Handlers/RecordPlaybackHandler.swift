//
//  RecordPlaybackHandler.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2019-03-24.
//  Copyright © 2019 Caweh Passereh. All rights reserved.
//

//import Foundation
//import AudioKit
//
//class RecordPlaybackHandler: DrumController {
//    
////    var trackRecorder = DrumController.init(nibName: nil, bundle: nil).
////    var trackRecording: AKAudioFile?
////    var trackPlayer: AKAudioPlayer!
////    var padRecorder: AKNodeRecorder?
////    
////    var isRecording = false
////    var isPlaying = false
//    
//    func startRecorder() {
//        
//        do {
//            trackRecording = try AKAudioFile()
//            try trackRecorder = AKNodeRecorder(node: mixer, file: trackRecording)
//            print("Track Recorder in function")
//        }   catch {
//            print("Track Recorder NOT IN FUNCTION")
//        }
//        
//    }
//    
//    func recordTrack() {
//        
//        if !isRecording {
//            do {
//                try trackRecorder?.record()
//                isRecording = true
//                isPlaying = false
////                DrumController().recordTrackImageColour()
////                DrumController().playImageColour()
//                print("Recording!")
//            } catch {
//                AKLog("Couldn't record")
//            }
//        } else {
//            print("Already recording! ")
//        }
//        
//    }
//    
//    func recordPad() {
//        
////        let shareTrackUrl = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Sound Bank/sample10", ofType: "mp3")!)
////
////        let activityVC = UIActivityViewController(activityItems: [shareTrackUrl],applicationActivities: nil)
////        activityVC.popoverPresentationController?.sourceView = self.view
////
////        self.present(activityVC, animated: true, completion: nil)
//        
//    }
//    
//    func playTrack() {
//        
//        if trackRecording != nil{
//            do {
//                trackPlayer = try AKAudioPlayer(file: trackRecording!)
//                mixer.connect(input: self.trackPlayer)
//                print("playing!")
//                trackPlayer.play()
//                isPlaying = true
//                
////                waveView.start()
//                
////                DrumController().playImageColour()
//                print("Playing track!")
//            } catch {
//                print("Nothing to play")
//            }
//        }
//        
//    }
//    
//    func stopTrack() {
//        
//        if isRecording {
//            trackRecorder?.stop()
//            trackRecording?.exportAsynchronously(name: "recordedTrack",
//                                                 baseDir: .resources,
//                                                 exportFormat: .m4a,
//                                                 callback: { (_, _) in})
//            
//            isRecording = false
//            print("succcess exporting track")
//            print(self.trackRecording)
//            
////            DrumController().recordTrackImageColour()
//        }
//        
//        if isPlaying {
//            trackPlayer.stop()
//            isPlaying = false
////            DrumController().playImageColour()
////            waveView.stop()
//        }
//        
//    }
//    
//}
