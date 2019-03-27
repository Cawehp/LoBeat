//
//  SettingsViewController.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2019-03-25.
//  Copyright © 2019 Caweh Passereh. All rights reserved.
//

import Foundation
import UIKit

//WHOLE CLASS UNDER CONSTRUCTION

class SettingsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        view.backgroundColor = .black
        
        let backButton = UIButton()
        let metronomeButton = UIButton()
        
        backButton.backgroundColor = .white
        metronomeButton.backgroundColor = .white
        
        metronomeButton.setTitle("Metronome \n On/Off", for: .normal)
        metronomeButton.setTitleColor(.black, for: .normal)
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        
        metronomeButton.layer.cornerRadius = 25.0
        backButton.layer.cornerRadius = 25.0
        
        backButton.frame = CGRect(x: view.frame.width/2 - 25 , y: view.frame.height - 100, width: 50, height: 50)
        metronomeButton.frame = CGRect(x: view.frame.width/2 - 100 , y: view.frame.height/2 - 200, width: 200, height: 200)
        
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchDown)
        metronomeButton.addTarget(self, action: #selector(metronomeButtonPressed(_:)), for: .touchDown)
        
        
        view.addSubview(backButton)
        view.addSubview(metronomeButton)
        
    }
    
    
    @objc func backButtonPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    @objc func metronomeButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "METRO GNOME", message: "The metronome is under construction", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default,
                                      handler: { _ in
                                        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)

        print("METRO GNOME UNDER CONSTRUCTION")
        
    }
    
}
