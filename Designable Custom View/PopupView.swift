//
//  PopupView.swift
//  Designable Custom View
//
//  Created by Chris Archibald on 10/8/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

@IBDesignable class PopupView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBInspectable var image: UIImage? {
        get {
            return imageView.image
        }
        set(image) {
            imageView.image = image
        }
    }
    
    
    var nibName = "PopupView"
    
    //When a Programer creates a PopupView
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setup()
    }
    
    //When Storyboard or UI file uses PopupView
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        var view = loadViewFromNib()
        //You want to use bounds, because it is the local set of x, y
        // frame will not work if we move it in the master view
        view.frame = self.bounds
        view.autoresizingMask = UIViewAutoresizing.FlexibleHeight.union(UIViewAutoresizing.FlexibleWidth)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        //This will grab the top level view
        let view  = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
  /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
