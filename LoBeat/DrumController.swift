//
//  ViewController.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2019-03-14.
//  Copyright © 2019 Caweh Passereh. All rights reserved.
//

import UIKit
import AudioKit 
import SwiftyWave

class DrumController: UIViewController {
    
    var topButtons = [UIButton]()
    var topButtonImages = [UIImage]()
    
    var trackRecorder: AKNodeRecorder?
    var trackRecording: AKAudioFile?
    var trackPlayer: AKAudioPlayer!
    var padRecorder: AKNodeRecorder?

    let drumSounds = [
        "sample1",
        "sample2",
        "sample3",
        "sample4",
        "sample5",
        "sample6",
        "sample7",
        "sample8",
        "sample9",
        "sample10",
        "sample11",
        "sample12",
        "sample13",
        "sample14",
        "sample15",
        "sample16"
    ];
    
    var drumPadButtons = [UIButton]()
    
    var players : [AKAudioPlayer]?
    var mixer = AKMixer()
    
    var waveView = SwiftyWaveView()
    
    var isRecording = false
    var isPlaying = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        AudioKit.output = mixer
        startAudioEngine()
        
        drumPadButtons = DrumButton().createDrumPadCollection(view: self.view)
        topButtons = TopButtons().createTopButtons(view: self.view)
        
//        SoundWaveGenerator().createSoundWave(view: self.view)
        topButtonImages = TopButtons().getImages()
        
        waveView = SwiftyWaveView(frame: CGRect(x: 8, y: view.frame.height/2 - view.frame.height/4 - 32, width: view.frame.width - 16, height: view.frame.height/4))
        view.addSubview(waveView)
        
    }
    
    
    func startAudioEngine() {
    
        do  {
            try AudioKit.start()
            print("AudioKit Started!")
        } catch {
            print("AudioKit Not Started")
        }

    }
    
    func playSample(senderTag : Int) {
        
        let sampleHolder = "Sound Bank/\(drumSounds[senderTag]).mp3"
        
        do {
            let sample = try AKAudioFile(readFileName: sampleHolder, baseDir: .resources)
            let player = try AKAudioPlayer(file: sample)
            mixer.connect(input: player)
            player.play()
        } catch {
            print("Sample not loaded")
        }
        
    }
    
    @objc func drumButtonTapped (_ sender: UIButton) {
        
        playSample(senderTag: sender.tag)
        
    }
    
    func startRecorder() {
        
        do {
            trackRecording = try AKAudioFile()
            try trackRecorder = AKNodeRecorder(node: mixer, file: trackRecording)
            print("Track Recorder in function")
        }   catch {
            print("Track Recorder NOT IN FUNCTION")
        }

    }
    
    func recordTrack() {
        
        if !isRecording {
            
            do {
                try trackRecorder?.record()
                isRecording = true
                isPlaying = false
                
                recordTrackImageColour()
                playImageColour()
                
            } catch {
                AKLog("Couldn't record")
            }
        } else {
            print("Already recording! ")
        }
        
    }
    
    func recordPad() {
        
        let shareTrackUrl = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Sound Bank/sample10", ofType: "mp3")!)
        
        let activityVC = UIActivityViewController(activityItems: [shareTrackUrl],applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    func playTrack() {
        
        if trackRecording != nil{
            do {
                trackPlayer = try AKAudioPlayer(file: trackRecording!)
                mixer.connect(input: trackPlayer)
                
                trackPlayer.play()
                isPlaying = true
                
                waveView.start()
                
                playImageColour()
                print("Playing track!")
            } catch {
                print("Nothing to play")
            }
        }
        
    }
    
    func stopTrack() {
        
        if  isRecording {
            trackRecorder?.stop()
            trackRecording?.exportAsynchronously(name: "recordedTrack",
                                                 baseDir: .resources,
                                                 exportFormat: .m4a,
                                                 callback: { (_, _) in})
            
            isRecording = false
            recordTrackImageColour()
        }

        if isPlaying {
            trackPlayer.stop()
            isPlaying = false
            playImageColour()
            waveView.stop()
        }
        
    }
    
    @objc func topButtonPressed(_ sender: UIButton) {
        
        switch sender.tag {
            case 0:
                startRecorder()
                recordTrack()
            case 1:
                recordPad()
            case 2:
                playTrack()
            case 3:
                stopTrack()
            default:
                print("default")
        }
        
    }
    
    func recordTrackImageColour() {
        
        if isRecording {
            topButtons[0].setImage(topButtonImages[4], for: .normal)
        } else if !isRecording {
            topButtons[0].setImage(topButtonImages[0], for: .normal)
        }
        
    }
    
    func playImageColour() {
        
        if isPlaying {
            topButtons[2].setImage(topButtonImages[6], for: .normal)
        } else if !isPlaying {
            topButtons[2].setImage(topButtonImages[2], for: .normal)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    
}



