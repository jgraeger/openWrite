//
//  EditTextView.swift
//  openWrite
//
//  Created by Johannes Gräger on 30.07.18.
//  Copyright © 2018 Johannes Gräger. All rights reserved.
//

import AppKit

class EditTextView: NSTextView {
    
    /**
     Creates a new instance
     
     :param frame               The view frame
     :param storage             The text storage
    
     :returns Initialized instance of openWrite-TextView
    */
    public init(frame: CGRect, textStorage: TextStorage = TextStorage()) {
        let textContainer = NSTextContainer()
        let layoutManager = NSLayoutManager()
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("[EditTextView] init(:coder) is not implemented yet" )
    }
}
