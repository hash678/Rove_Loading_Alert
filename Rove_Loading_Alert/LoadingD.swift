//
//  LoadingD.swift
//  Rove Teacher Portal
//
//  Created by Hassan Abbasi on 26/05/2019.
//  Copyright © 2019 Rove. All rights reserved.
//

import Foundation
import UIKit

class LoadingD{
    
    let viewController:UIViewController?
    var alert_G:loading_alert?
    var overlay_G:UIView?
    var showing = false
    let logo:UIImage!
    
    init(vc:UIViewController?, logo:UIImage){
        viewController = vc
        self.logo = logo
    }
    
    public func show(){
        guard let vc = viewController else{
            return
        }
        let overlay = UIView()
        overlay.frame = vc.view.frame
        overlay.backgroundColor = UIColor.black
        overlay.alpha = 0.8
        vc.view.addSubview(overlay)
        
        let width_alert:CGFloat = 200
        let height_alert:CGFloat = 150
        
        let x = (vc.view.frame.width / 2) - (width_alert/2)
        let y = (vc.view.frame.height / 2) - (height_alert/2)
        let alert = loading_alert(frame:CGRect(x: x, y: y, width: width_alert, height: height_alert))
        alert.layer.borderWidth = 2
        alert.layer.borderColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        alert.layer.cornerRadius = 10
        alert.layer.masksToBounds = true
        alert.logoImage = logo
        vc.view.addSubview(alert)
        alert.rotateImage()

        
        alert_G = alert
        overlay_G = overlay
        showing = true
        //rotateImage(logo: logo)
    }
    
    
   public func hide(){
        
        if showing{
            alert_G?.showing = false
            alert_G?.removeFromSuperview()
            overlay_G?.removeFromSuperview()
            showing = false
        }
    }
}
