import XCTest

class SwiftStringTests: XCTestCase {
    
    //MARK: - change to value
    func testToBool() {
        XCTAssert("asdwads".toBool() == nil)
        XCTAssert("true".toBool() == true)
        XCTAssert("false".toBool() == false)
    }
    
    func testToFloat() {
        XCTAssert("asdwads".toFloat() == nil)
        XCTAssert("2.00".toFloat() == 2.0)
        XCTAssert("2".toFloat() == 2.0)
    }
    
    func testToInt() {
        XCTAssert("asdwads".toInt() == nil)
        XCTAssert("2.00".toInt() == 2)
        XCTAssert("2".toInt() == 2)
    }
    
    func testToDate() {
        XCTAssert("asdwads".toDate() == nil)
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: "2014-06-03".toDate()!)
        
        XCTAssert(components.year == 2014)
        XCTAssert(components.month == 6)
        XCTAssert(components.day == 3)
    }
    
    func testToDateTime() {
        XCTAssert("asdwads".toDateTime() == nil)
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year, .Hour, .Minute, .Second], fromDate: "2014-06-03 13:15:01".toDateTime()!)
        
        XCTAssert(components.year == 2014)
        XCTAssert(components.month == 6)
        XCTAssert(components.day == 3)
        XCTAssert(components.hour == 13)
        XCTAssert(components.minute == 15)
        XCTAssert(components.second == 1)
    }
    
    func testToDouble() {
        XCTAssert("asdwads".toDouble() == nil)
        XCTAssert("2.00".toDouble() == 2.0)
        XCTAssert("2".toDouble() == 2.0)
    }
    
    //MARK: - is judge
    func testIsAlpha() {
        XCTAssert("fdafaf3".isAlpha() == false)
        XCTAssert("afaf".isAlpha() == true)
        XCTAssert("dfdf--dfd".isAlpha() == false)
    }
    
    func testIsAlphaNumeric() {
        XCTAssert("afaf35353afaf".isAlphaNumeric() == true)
        XCTAssert("FFFF99fff".isAlphaNumeric() == true)
        XCTAssert("99".isAlphaNumeric() == true)
        XCTAssert("afff".isAlphaNumeric() == true)
        XCTAssert("-33".isAlphaNumeric() == false)
        XCTAssert("aaff..".isAlphaNumeric() == false)
    }

    func testIsNumeric() {
        XCTAssert("abc".isNumeric() == false)
        XCTAssert("123a".isNumeric() == false)
        XCTAssert("1".isNumeric() == true)
        XCTAssert("22".isNumeric() == true)
        XCTAssert("33.0".isNumeric() == true)
        XCTAssert("-63.0".isNumeric() == true)
    }
    
    func testIsEmpty() {
        XCTAssert("".isEmpty() == true)
        XCTAssert(" ".isEmpty() == true)
        XCTAssert("\t\t\t ".isEmpty() == true)
        XCTAssert("\n\n".isEmpty() == true)
        XCTAssert("helo".isEmpty() == false)
    }

    func testIsStartsWith() {
        XCTAssert("hello world".isStartsWith("hello") == true)
        XCTAssert("hello world".isStartsWith("foo") == false)
    }

    func testIsEndsWith() {
        XCTAssert("hello world".isEndsWith("world") == true)
        XCTAssert("hello world".isEndsWith("foo") == false)
    }

    func testContains() {
        XCTAssert("foobar".contains("foo") == true)
        XCTAssert("foobar".contains("ba") == true)
        XCTAssert("foobar".contains("something") == false)
    }

    //MARK: - get substring
    func testSubscripts() {
        let subject = "hello world"
        XCTAssert(subject[0...1] == "he")
        XCTAssert(subject[0..<1] == "h")
        XCTAssert(subject[0] == "h")
        XCTAssert(subject[0...10] == "hello world")
    }

    func testBetween() {
        XCTAssert("<a>foo</a>".between("<a>", "</a>") == "foo", "between")
        XCTAssert("<a><a>foo</a></a>".between("<a>", "</a>") == "<a>foo</a>", "between")
        XCTAssert("<a>foo".between("<a>", "</a>") == nil, "between")
        XCTAssert("Some strings } are very {weird}, dont you think?".between("{", "}") == "weird", "between")
        XCTAssert("<a></a>".between("<a>", "</a>") == nil, "between")
        XCTAssert("<a>foo</a>".between("<a>", "<a>") == nil, "between")
    }

    //MARK: - set substring
    func testReplace() {
        var value = "foobar"
        value.replace("foo", with: "fff")
        XCTAssert(value == "fffbar")
        
        value = "foobar"
        value.replace("bar", with: "bb")
        XCTAssert(value == "foobb")
        
        value = "footfootbar"
        value.replace("foo", with:"fff")
        XCTAssert(value == "ffftffftbar")
        
        value = "foo foo bar bar"
        value.replace(0, 3, with: "bar")
        XCTAssert(value == "bar foo bar bar")
    }
    
    //MARK: - Misc
    func testTimes() {
        XCTAssert("hi".times(3) == "hihihi")
        XCTAssert(" ".times(10) == "          ")
    }
    
    func testJoin() {
        XCTAssert(",".join([1,2,3]) == "1,2,3")
        XCTAssert(",".join([]) == "")
        XCTAssert(",".join(["a","b","c"]) == "a,b,c")
        XCTAssert("! ".join(["hey","who are you?"]) == "hey! who are you?")
    }
    
   
    func testSplit() {
        XCTAssert("hello world".split(" ")[0] == "hello")
        XCTAssert("hello world".split(" ")[1] == "world")
        XCTAssert("helloworld".split(" ")[0] == "helloworld")
    }
    
    func testRangeFromNSRange() {
        let nsrange = NSRange(location: 0, length: 4)
        let range = String.rangeFromNSRange(nsrange)
        XCTAssert(range.startIndex == 0)
        XCTAssert(range.endIndex == 4)
    }
}
