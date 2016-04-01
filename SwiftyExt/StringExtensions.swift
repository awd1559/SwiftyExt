//
//  SwiftString.swift
//  SwiftString
//
//  Created by Andrew Mayne on 30/01/2016.
//  Copyright © 2016 Red Brick Labs. All rights reserved.
//

public extension String {
    func toBool() -> Bool? {
        let trimmed = self.trimmed().lowercaseString
        if trimmed == "true" || trimmed == "false" {
            return (trimmed as NSString).boolValue
        }
        return nil
    }
    
    func toFloat() -> Float? {
        if let number = NSNumberFormatter().numberFromString(self) {
            return number.floatValue
        }
        return nil
    }
    
    func toInt() -> Int? {
        if let number = NSNumberFormatter().numberFromString(self) {
            return number.integerValue
        }
        return nil
    }
    
    func toDouble(locale: NSLocale = NSLocale.systemLocale()) -> Double? {
        let nf = NSNumberFormatter()
        nf.locale = locale
        if let number = nf.numberFromString(self) {
            return number.doubleValue
        }
        return nil
    }

    func toDate(format: String = "yyyy-MM-dd") -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(self)
    }
    
    func toDateTime(format: String = "yyyy-MM-dd HH:mm:ss") -> NSDate? {
        return toDate(format)
    }
    
    func isAlpha() -> Bool {
        for chr in characters {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
                return false
            }
        }
        return true
    }
    
    func isAlphaNumeric() -> Bool {
        let alphaNumeric = NSCharacterSet.alphanumericCharacterSet()
        return componentsSeparatedByCharactersInSet(alphaNumeric).joinWithSeparator("").length == 0
    }
    
    func isNumeric() -> Bool {
        if let _ = NSNumberFormatter().numberFromString(self) {
            return true
        }
        return false
    }
    
    func isEmpty() -> Bool {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).length == 0
    }
    
    func indexAt(at:Int) -> String {
        let index = self.startIndex.advancedBy(at)
        return String(self[index])
    }
    
    func indexOf(substring: String) -> Int? {
        if let range = rangeOfString(substring) {
            return startIndex.distanceTo(range.startIndex)
        }
        return nil
    }
    
    func contains(substring: String) -> Bool {
        return rangeOfString(substring) != nil
    }
    
    func hasNumberOf(substring: String) -> Int {
        return componentsSeparatedByString(substring).count-1
    }
    
    func startsWith(prefix: String) -> Bool {
        return hasPrefix(prefix)
    }
    
    func endsWith(suffix: String) -> Bool {
        return hasSuffix(suffix)
    }
    
    func between(left: String, _ right: String) -> String? {
        guard
            let leftRange = rangeOfString(left), rightRange = rangeOfString(right, options: .BackwardsSearch)
            where left != right && leftRange.endIndex != rightRange.startIndex
            else { return nil }
        
        return self[leftRange.endIndex...rightRange.startIndex.predecessor()]
        
    }
    
    func chompLeft(prefix: String) -> String {
        if let prefixRange = rangeOfString(prefix) {
            if prefixRange.endIndex >= endIndex {
                return self[startIndex..<prefixRange.startIndex]
            } else {
                return self[prefixRange.endIndex..<endIndex]
            }
        }
        return self
    }
    
    func chompRight(suffix: String) -> String {
        if let suffixRange = rangeOfString(suffix, options: .BackwardsSearch) {
            if suffixRange.endIndex >= endIndex {
                return self[startIndex..<suffixRange.startIndex]
            } else {
                return self[suffixRange.endIndex..<endIndex]
            }
        }
        return self
    }
    
    func collapseWhitespace() -> String {
        let components = componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).filter { !$0.isEmpty }
        return components.joinWithSeparator(" ")
    }
    
    func trimmedLeft() -> String {
        if let range = rangeOfCharacterFromSet(NSCharacterSet.whitespaceAndNewlineCharacterSet().invertedSet) {
            return self[range.startIndex..<endIndex]
        }
        return self
    }
    
    func trimmedRight() -> String {
        if let range = rangeOfCharacterFromSet(NSCharacterSet.whitespaceAndNewlineCharacterSet().invertedSet, options: NSStringCompareOptions.BackwardsSearch) {
            return self[startIndex..<range.endIndex]
        }
        return self
    }
    
    func trimmed() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func times(n: Int) -> String {
        return (0..<n).reduce("") { $0.0 + self }
    }
    
    func join<S: SequenceType>(elements: S) -> String {
        return elements.map{String($0)}.joinWithSeparator(self)
    }
    
    func split(separator: Character) -> [String] {
        return characters.split{$0 == separator}.map(String.init)
    }
    
    func substring(startIndex: Int, length: Int) -> String {
        let start = self.startIndex.advancedBy(startIndex)
        let end = self.startIndex.advancedBy(startIndex + length)
        return self[start..<end]
    }
    
    var length: Int {
        get {
            return self.characters.count
        }
    }
    
    subscript(r: Range<Int>) -> String {
        get {
            let startIndex = self.startIndex.advancedBy(r.startIndex)
            let endIndex = self.startIndex.advancedBy(r.endIndex - r.startIndex)
            return self[startIndex..<endIndex]
        }
    }
    
    subscript(i: Int) -> Character {
        get {
            let index = self.startIndex.advancedBy(i)
            return self[index]
        }
    }    
}
