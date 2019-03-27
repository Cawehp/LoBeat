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
import AVFoundation

class DrumController: UIViewController {
    
    var topButtons = [UIButton]()
    var topButtonImages = [UIImage]()
    var shareSettingsButtons = [UIButton]()
    
    var trackRecorder: AKNodeRecorder?
    var trackRecording: AKAudioFile?
    var trackPlayer: AKAudioPlayer!
    var padRecorder: AKNodeRecorder?
    
    var drumPadButtons = [UIButton]()
    
    var players : [AKAudioPlayer]?
    var mixer = AKMixer()
    
    var waveView = SwiftyWaveView()
    
    var settings = [AVFormatIDKey:kAudioFormatAppleIMA4,
                          AVSampleRateKey:44100.0,
                          AVNumberOfChannelsKey:2,AVEncoderBitRateKey:12800,
                          AVLinearPCMBitDepthKey:16,
                          AVEncoderAudioQualityKey:AVAudioQuality.high.rawValue] as [String : Any]
    
    
    var isRecording = false
    var isPlaying = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        AudioKit.output = mixer
        startAudioEngine()
        
        drumPadButtons = DrumButton().createDrumPadCollection(view: self.view)
        topButtons = TopButtons().createTopButtons(view: self.view)
        shareSettingsButtons = SettingsShareButtons().createSettingsShareButtons(view: self.view)
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
    
    @objc func drumButtonTapped (_ sender: UIButton) {
        
        DrumHandler().playSample(senderTag: sender.tag, mixer: mixer)
        
    }
    
    func startRecorder() {
        
        do {
            trackRecording = try AKAudioFile(writeIn: .documents, name: "RecordedTrack", settings: settings)
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
//        TODO
//        set up recording of new samples for pads
        print("Recording Pad!")

        
    }
    
    func playTrack() {
        
        if isPlaying {
            print("already playing!")
        } else if trackRecording != nil{
            do {
                trackPlayer = try AKAudioPlayer(file: trackRecording!)
                mixer.connect(input: trackPlayer)
                
                isPlaying = true
                
                trackPlayer.play()
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
            trackRecording?.exportAsynchronously(name: "TempTrack",
                                                 baseDir: .documents,
                                                 exportFormat: .m4a,
                                                 fromSample: 44_100,
                                                 toSample: 44_300,
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
    
    @objc func shareOptionsPressed(_ sender: UIButton) {
        
        if sender.tag == 0 {
            
            let settingsView = SettingsViewController()
            self.present(settingsView, animated: true, completion: nil)
            
        } else if sender.tag == 1 {
            
            do {
                try AudioKit.renderToFile(trackRecording!, duration: trackRecording!.duration) {
                    self.trackPlayer.play()
                }
                print(trackRecording)
                print("RENDERED!")
            } catch {
                print("Didnt render")
            }
            
            
            let activityVC = UIActivityViewController(activityItems: [getTrackURL()],applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
            
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
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func getTrackURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent("RecordedTrack.m4a")
    }

    
}



