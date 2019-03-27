//
//  SettingsViewController.swift
//  LoBeat
//
//  Created by Caweh Passereh on 2019-03-25.
//  Copyright © 2019 Caweh Passereh. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    
    override func viewDidLoad() {
//        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let backButton = UIButton()
        backButton.backgroundColor = .white
        
        backButton.frame = CGRect(x: view.frame.width/2, y: view.frame.height, width: 50, height: 50)
        
        backButton.center = self.view.center
        
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchDown)
        
        view.addSubview(backButton)
        
    }
    
    
    @objc func backButtonPressed(_ sender: UIButton) {
        
        
        let drumView = DrumController()
        self.present(drumView, animated: true, completion: nil)
        
        
    }
    
}
