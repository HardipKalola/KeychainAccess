//
//  ViewController.swift
//  KeyChainAccessDemo
//
//  Created by Hardip Kalola on 25/07/18.
//  Copyright © 2018 Hardip Kalola. All rights reserved.
//

import UIKit
let TegKeychainDemo_keyName = "my key"

class ViewController: UIViewController {
    
//    let hkKeychainWreapper = HKKeychainWrapper()
    let keychainItemKey = "myKey"
    @IBOutlet weak var label: UILabel!
    let keychain = KeychainSwift()

    override func viewDidLoad() {
        super.viewDidLoad()
        let appIdPrefix = Bundle.main.object(forInfoDictionaryKey: "AppIdentifierPrefix")
        print(appIdPrefix)
//        hkKeychainWreapper.accessGroup = "EUJ76RR773.myKeychainGroup1"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func updateValueLabel() {
        keychain.synchronizable = true
        if let value = keychain.get(TegKeychainDemo_keyName) {
            self.label.text = "In Keychain: \(value)"
        } else {
            self.label.text = "no value in keychain"
        }
    }
    @IBAction func addItemTapped(_ sender: AnyObject) {
        keychain.synchronizable = true
        keychain.set("How R U!", forKey: TegKeychainDemo_keyName)
        updateValueLabel()
    }
    
    @IBAction func getItemTapped(_ sender: AnyObject) {
       updateValueLabel()
    }
    

    @IBAction func removeItemTapped(_ sender: AnyObject) {
        keychain.synchronizable = true
        keychain.delete(TegKeychainDemo_keyName)
        updateValueLabel()
    }
}

