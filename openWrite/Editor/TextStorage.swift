// Universal build for UIKit and AppKit
//
//  Storage.swift
//  openWrite
//
//  Created by Johannes Gräger on 30.07.18.
//  Copyright © 2018 Johannes Gräger. All rights reserved.
//

#if os(macOS)
    import AppKit
#elseif os(iOS)
    import UIKit
#endif

class TextStorage: NSTextStorage {
    
    // TODO: We could add theming here
    
    private var backendStore = NSTextStorage()
    
    public override var string: String {
        get {
            return backendStore.string
        }
    }
    
    // MARK: Initializers
    
    override public init() {
        super.init()
    }
    
    override public init(attributedString attrStr: NSAttributedString) {
        super.init(attributedString: attrStr)
        self.backendStore.setAttributedString(attrStr)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("[TextStorage] init?(aDecoer: NSCoder) is not implemented!")
    }
    
    
    #if os(macOS)
    
    required public init?(pasteboardPropertyList propertyList: Any, ofType type: NSPasteboard.PasteboardType) {
        fatalError("[TextStorage] init?(propertyList, ofType type) is not implemented!")
    }
    
    #endif
    
    // MARK: Api
    
    /// Finds attributes within a given range on a String.
    ///
    /// - parameter location: How far into the String to look.
    /// - parameter range:    The range to find attributes for.
    ///
    /// - returns: The attributes on a String within a certain range.
    override public func attributes(at location: Int, longestEffectiveRange range: NSRangePointer?, in rangeLimit: NSRange) -> [NSAttributedStringKey : Any] {
        return self.backendStore.attributes(at: location, effectiveRange: range)
    }
    
    /// Retrieves the attributes of a string for a particular range.
    ///
    /// - parameter at: The location to begin with.
    /// - parameter range: The range in which to retrieve attributes.
    override public func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [NSAttributedStringKey : Any] {
        return self.backendStore.attributes(at: location, effectiveRange: range)
    }
    
    /// Replaces edited characters in certain range with a new string
    ///
    /// - parameter range: The range to replace.
    /// - parameter str:   The new string to replace the range with.
    override public func replaceCharacters(in range: NSRange, with str: String) {
        self.beginEditing()
        self.backendStore.replaceCharacters(in: range, with: str)
        let change = str.count - range.length
        self.edited([.editedAttributes, .editedCharacters], range: range, changeInLength: change)
        self.endEditing()
    }
    
    /// Replace attributes on a string for particular range
    ///
    /// - parameter attrs: The attributes to apply
    /// - parameter range: The range in which to set the attributes
    public override func setAttributes(_ attrs: [NSAttributedStringKey : Any]?, range: NSRange) {
        self.beginEditing()
        self.backendStore.setAttributes(attrs, range: range)
        self.edited(.editedAttributes, range: range, changeInLength: 0)
        self.endEditing()
    }
    
    
}
