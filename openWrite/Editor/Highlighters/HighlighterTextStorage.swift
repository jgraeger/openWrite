//
//  HighlighterStorage.swift
//  openWrite
//
//  Created by Johannes Gräger on 30.07.18.
//  Copyright © 2018 Johannes Gräger. All rights reserved.
//

import AppKit

public class HighlighterTextStorage: NSTextStorage {
    
    private let backendStore: NSMutableAttributedString
    private var highlighters: [Highlighter] = []
    
    public var defaultAttributes: [NSAttributedStringKey: Any] = [
        NSAttributedStringKey.font: NSFont(name: "Inconsolata-Regular", size: NSFont.systemFontSize)
    ] {
        didSet {
            self.editedAll(editActions: .editedAttributes)
        }
    }
    
    // MARK: Initializers
    public override init() {
        backendStore = NSMutableAttributedString(string: "", attributes: defaultAttributes)
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        backendStore = NSMutableAttributedString(string: "", attributes: defaultAttributes)
        super.init(coder: aDecoder)
    }
    
    required public init?(pasteboardPropertyList propertyList: Any, ofType type: NSPasteboard.PasteboardType) {
        backendStore = NSMutableAttributedString(string: "", attributes: defaultAttributes)
        super.init(pasteboardPropertyList: propertyList, ofType: type)
    }
    
    // MARK: NSTextStorage
    
    public override var string: String {
        return backendStore.string
    }
    
    public override func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [NSAttributedStringKey : Any] {
        return backendStore.attributes(at: location, effectiveRange: range)
    }
    
    public override func replaceCharacters(in range: NSRange, with attrString: NSAttributedString) {
        self.backendStore.replaceCharacters(in: range, with: attrString)
        self.edited(.editedCharacters, range: range, changeInLength: attrString.length - range.length)
    }
    
    public override func setAttributes(_ attrs: [NSAttributedStringKey : Any]?, range: NSRange) {
        self.backendStore.setAttributes(attrs, range: range)
        self.edited(.editedAttributes, range: range, changeInLength: 0)
    }
    
    private func editedAll(editActions: NSTextStorageEditActions) {
        self.edited(editActions, range: NSRange(location: 0, length: self.backendStore.length), changeInLength: 0)
    }
    
}
