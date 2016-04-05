
public extension String {
    //MARK: - change to value
    func toBool() -> Bool? {
        let trimmed = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).lowercaseString
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
    
    //MARK: - is judge
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
    
    func isStartsWith(prefix: String) -> Bool {
        return hasPrefix(prefix)
    }
    
    func isEndsWith(suffix: String) -> Bool {
        return hasSuffix(suffix)
    }
    
    func contains(substring: String) -> Bool {
        return rangeOfString(substring) != nil
    }
    
    //MARK: - get substring
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
    
    func between(left: String, _ right: String) -> String? {
        guard
            let leftRange = rangeOfString(left), rightRange = rangeOfString(right, options: .BackwardsSearch)
            where left != right && leftRange.endIndex != rightRange.startIndex
            else { return nil }
        
        return self[leftRange.endIndex...rightRange.startIndex.predecessor()]
        
    }
    
    //MARK: - set substring
    mutating func replace(src:String, with value:String) {
        let components = componentsSeparatedByString(src)
        let count = components.count
        
        var temp = ""
        for i in 0..<count-1 {
            temp += components[i] + value
        }
        temp += components[count-1]
        self = temp
    }
    
    mutating func replace(start:Int, _ end:Int, with value:String) {
        self.replaceRange(Range(self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(end)), with: value)
    }
    
    //MARK: - Misc
    func times(n: Int) -> String {
        return (0..<n).reduce("") { $0.0 + self }
    }
    
    func join<S: SequenceType>(elements: S) -> String {
        return elements.map{String($0)}.joinWithSeparator(self)
    }
    
    func split(separator: Character) -> [String] {
        return characters.split{$0 == separator}.map(String.init)
    }
    
    static func rangeFromNSRange(nsRange : NSRange) -> Range<Int> {
        let location = nsRange.location
        let length = nsRange.length
        return Range(location..<location+length)
    }
    
    var length: Int {
        get {
            return self.characters.count
        }
    }
    
    
}
