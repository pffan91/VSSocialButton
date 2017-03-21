//
//  ViewController.swift
//  VSSocialButton
//
//  Created by developer-semenchenko on 03/18/2017.
//  Copyright (c) 2017 developer-semenchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sb: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
    
    // MARK: - ViewController Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - User Interaction
    @IBAction func didPressFacebookButton(_ sender: Any) {
        self.navigationController?.pushViewController(sb.instantiateViewController(withIdentifier: "FacebookViewController"), animated: true)
    }
    
    @IBAction func didPressVKontakteButton(_ sender: Any) {
        self.navigationController?.pushViewController(sb.instantiateViewController(withIdentifier: "VKontakteViewController"), animated: true)
    }
    
    @IBAction func didPressTwitterButton(_ sender: Any) {
        self.navigationController?.pushViewController(sb.instantiateViewController(withIdentifier: "TwitterViewController"), animated: true)
    }
}

