//
//  EditViewController.swift
//  openWrite
//
//  Created by Johannes Gräger on 31.07.18.
//  Copyright © 2018 Johannes Gräger. All rights reserved.
//

import AppKit
import Cocoa


class EditViewController : NSViewController {
    
    override func viewDidLoad() {
        print("Okay")
        
        super.viewDidLoad()
        
        let storage = TextStorage()
        let textView = EditTextView(frame: CGRect.zero, textStorage: storage)
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        
        // Add constraints
        let views = ["editTextView": textView]
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[textView]-20-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[textView]-20-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
    }
}
