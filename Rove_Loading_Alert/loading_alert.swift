//
//  loading_alert.swift
//  Rove Teacher Portal
//
//  Created by Hassan Abbasi on 26/05/2019.
//  Copyright © 2019 Rove. All rights reserved.
//

import UIKit

class loading_alert: UIView {

    var showing = true
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var contentView:UIView!
    var logoImage:UIImage?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setupView()
    }
    func setupView(){
        
     Bundle.main.loadNibNamed("loading_alert", owner: self, options: nil)
        addSubview(contentView)
        logo.image = logoImage
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    
    
    func rotateImage(){
        if showing{
            UIView.animate(withDuration: 1, animations: {
              
                self.logo.transform = self.logo.transform.rotated(by: CGFloat(Double.pi))
            }) { [weak self](finished) in
              self?.rotateImage()
            }
        }
        
    }
}
