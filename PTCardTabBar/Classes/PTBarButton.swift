//
//  PTTabBarButtonItem.swift
//  PTR
//
//  Created by Hussein AlRyalat on 4/7/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import UIKit


public class PTBarButton: UIButton {
    
    var selectedColor: UIColor! = .black {
        didSet {
            reloadApperance()
        }
    }
    
    var title: String = ""
    
    var unselectedColor: UIColor! = UIColor(rgb: 0x9b9b9b) {
        didSet {
            reloadApperance()
        }
    }
    
    init(forItem item: UITabBarItem) {
        super.init(frame: .zero)
        setImage(item.image, for: .normal)
    }
    
    init(image: UIImage){
        super.init(frame: .zero)
        setImage(image, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override public var isSelected: Bool {
        didSet {
            reloadApperance()
        }
    }
    
    func reloadApperance(){
        self.tintColor = isSelected ? selectedColor : unselectedColor
        self.setTitleColor(selectedColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.titleEdgeInsets = isSelected ?
            UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0) :
            UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.setTitle(isSelected ? title : "", for: .normal)
        self.backgroundColor = isSelected ? UIColor(red: 25/255.0, green: 119/255.0, blue: 242/255.0, alpha: 0.15) : .clear
        self.setCurvedView(cornerRadius: self.frame.height/2)
    }
}

extension UIView {
    func setCurvedView(cornerRadius: CGFloat , masksToBounds: Bool = true) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0
        self.layer.masksToBounds = masksToBounds
    }
}
