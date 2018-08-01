//
//  HighlighterType.swift
//  openWrite
//
//  Created by Johannes Gräger on 30.07.18.
//  Copyright © 2018 Johannes Gräger. All rights reserved.
//

import AppKit

public protocol Highlighter {
    
    /**
     Highlight text in an "AttributedString"
    */
    func highlight(_ attributedString: NSMutableAttributedString)
    
}
