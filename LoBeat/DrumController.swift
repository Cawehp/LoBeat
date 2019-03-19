//
//  ViewController.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2019-03-14.
//  Copyright © 2019 Caweh Passereh. All rights reserved.
//

import UIKit
import AudioKit
import AVFoundation

class DrumController: UIViewController {
    
    var topButtons = [UIButton]()
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
    var engine = AVAudioEngine()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        AudioKit.output = mixer
        startAudioEngine()
        
        drumPadButtons = DrumButton().createDrumPadCollection(view: self.view)
        topButtons = TopButtons().createTopButtons(view: self.view)
        
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
        
        do {
            try trackRecorder?.record()
            print("recording!")
        } catch {
            AKLog("Couldn't record")
        }
        
    }
    
    func recordPad() {
        //        TODO
        //        set up function for recording new pad sample.
        print("Recording Pad!")
        
    }
    
    func playTrack() {
        
        if trackRecording != nil{
            do {
                trackPlayer = try AKAudioPlayer(file: trackRecording!)
                mixer.connect(input: trackPlayer)
                trackPlayer.play()
                print("Playing track!")
            } catch {
                print("Nothing to play")
            }
        }
        
    }
    
    func stopTrack() {

        if trackRecorder != nil {
            if  trackRecorder!.isRecording {
                trackRecorder?.stop()
                trackRecording?.exportAsynchronously(name: "tempFile.m4a",
                                                     baseDir: .documents,
                                                     exportFormat: .m4a,
                                                     callback: { (_, _) in})
            } else {
                trackPlayer.stop()
            }
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
    
}



