//
//  ViewController.swift
//  googleAdmodApp
//
//  Created by 伊藤和也 on 2020/07/02.
//  Copyright © 2020 kazuya ito. All rights reserved.
///Users/kazuyaito/Desktop/googleAdmodApp/googleAdmodApp/Info.plist

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //GoogleAds Config
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }


}

