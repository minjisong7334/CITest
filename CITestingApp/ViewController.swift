//
//  ViewController.swift
//  CITestingApp
//
//  Created by minji song on 5/10/18.
//  Copyright © 2018 minji song. All rights reserved.
//

import UIKit

struct Constants
{
    static let adColonyAppID = "appbdee68ae27024084bb334a"
    static let adColonyInterstitialZoneID = "vzf8fb4670a60e4a139d01b5"
    static let adColonyRewardedZoneID = "vzf8e4e97704c4445c87504e"
}

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var configureButton: UIButton!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    var decURL: String!
    var ad: AdColonyInterstitial?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onShow(_ sender: Any) {
    
    }
    
    @IBAction func onRequest(_ sender: Any) {
     //   AdColony.requestInterstitial(inZone: <#T##String#>, options: <#T##AdColonyAdOptions?#>, success: <#T##(AdColonyInterstitial) -> Void#>, failure: <#T##((AdColonyAdRequestError) -> Void)?##((AdColonyAdRequestError) -> Void)?##(AdColonyAdRequestError) -> Void#>)
    }
    
    @IBAction func onConfigure(_ sender: Any) {
        
        if(checkLinkFormat(textField.text!)){
        let options = AdColonyOptions()
            options.setOption("force_dec_url", withStringValue: textField.text!)
        AdColony.configure(withAppID: Constants.adColonyAppID, zoneIDs: [Constants.adColonyRewardedZoneID, Constants.adColonyInterstitialZoneID], options: options as? AdColonyAppOptions, completion: {(zones) in
            self.configureButton.isEnabled = false
            self.requestButton.isEnabled = true
        })
        }
        else {
            //TO-DO: alter when the format is wrong.
            
        }
    }
    
    
    
    //TextField안에 수정한 Text가 empty이면 DoneBarbutton disalbe 시키기
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        if newText.isEmpty {
            configureButton.isEnabled = false
        }
        else {
            configureButton.isEnabled = true
        }
        return true
    }
    
    func checkLinkFormat(_ urlFormat: String) -> Bool {
        //TO-DO: au file format check
        
        return true
    }
    
}

