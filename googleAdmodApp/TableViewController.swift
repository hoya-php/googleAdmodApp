//
//  TableViewController.swift
//  googleAdmodApp
//
//  Created by 伊藤和也 on 2020/07/02.
//  Copyright © 2020 kazuya ito. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TableViewController: UITableViewController, GADBannerViewDelegate,GADInterstitialDelegate {
    
    //Cell DataList
    var profileImageArray = ["0","1","2","3","4"]
    var textArray = ["FaceImage0",
                     "FaceImage1",
                     "FaceImage2",
                     "FaceImage3",
                     "インタースティシャル"]
    
    var interstitial: GADInterstitial!
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "backGrondImage")
        backgroundImageView.frame = CGRect(x: 0,
                                           y: 0,
                                           width: view.frame.size.width,
                                           height: view.frame.size.height)
        backgroundImageView.image = image
        tableView.backgroundView = backgroundImageView
        
        interstitial = createAndLoadInterStitial()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1 + textArray.count
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indexNumber = indexPath.row
        
        if indexNumber == 0 {
            //もしインタースティシャルの広告セルがタップされたならば
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath)
            let bannerView = cell.viewWithTag(1) as! GADBannerView
            
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            let profileImageView = cell.viewWithTag(1) as! UIImageView
            profileImageView.image = UIImage(named: profileImageArray[indexNumber - 1])
            
            let nameLabel = cell.viewWithTag(2) as! UILabel
            
            nameLabel.textColor = .white
            nameLabel.font = .boldSystemFont(ofSize: 20)
            nameLabel.numberOfLines = 3
            nameLabel.text = textArray[indexNumber - 1]
            
            return cell
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 5 {
            
            if interstitial.isReady {
                
                interstitial.present(fromRootViewController: self)
                
            } else {
                
                print("広告未準備")
                
            }
        }
  
    }
    
    func createAndLoadInterStitial() -> GADInterstitial {
        
        var interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        
        return interstitial
        
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        
        interstitial = createAndLoadInterStitial()
        
    }
    
}
