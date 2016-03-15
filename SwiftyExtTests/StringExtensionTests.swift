import XCTest

class SwiftStringTests: XCTestCase {
    
    func testBetween() {
        XCTAssert("<a>foo</a>".between("<a>", "</a>") == "foo", "between")
        XCTAssert("<a><a>foo</a></a>".between("<a>", "</a>") == "<a>foo</a>", "between")
        XCTAssert("<a>foo".between("<a>", "</a>") == nil, "between")
        XCTAssert("Some strings } are very {weird}, dont you think?".between("{", "}") == "weird", "between")
        XCTAssert("<a></a>".between("<a>", "</a>") == nil, "between")
        XCTAssert("<a>foo</a>".between("<a>", "<a>") == nil, "between")
    }
    
    func testCamelize() {
        XCTAssert("os version".camelize() == "osVersion")
        XCTAssert("HelloWorld".camelize() == "helloWorld")
        XCTAssert("someword With Characters".camelize() == "somewordWithCharacters")
        XCTAssert("data_rate".camelize() == "dataRate")
        XCTAssert("background-color".camelize() == "backgroundColor")
    }
    
    func testCapitalize() {
        XCTAssert("hello world".capitalize() == "Hello World")
    }
    
    func testChompLeft() {
        XCTAssert("foobar".chompLeft("foo") == "bar")
        XCTAssert("foobar".chompLeft("bar") == "foo")
    }
    
    func testChompRight() {
        XCTAssert("foobar".chompRight("bar") == "foo")
        XCTAssert("foobar".chompRight("foo") == "bar")
    }
    
    func testClean() {
        XCTAssert("thisoneistwoathreetest".clean(with: " ", allOf: "one", "two", "three") == "this is a test")
    }
    
    func testCollapseWhitespace() {
        XCTAssert("  String   \t libraries are   \n\n\t fun\n!  ".collapseWhitespace() == "String libraries are fun !")
    }
    
    func testContains() {
        XCTAssert("foobar".contains("foo") == true)
        XCTAssert("foobar".contains("ba") == true)
        XCTAssert("foobar".contains("something") == false)
    }
    
    func testCount() {
        XCTAssert("hi hi ho hey hihey".count("hi") == 3)
    }
    
    func testEndsWith() {
        XCTAssert("hello world".endsWith("world") == true)
        XCTAssert("hello world".endsWith("foo") == false)
    }
    
    func testEnsureLeft() {
        XCTAssert("/subdir".ensureLeft("/") == "/subdir")
        XCTAssert("subdir".ensureLeft("/") == "/subdir")
    }
    
    func testEnsureRight() {
        XCTAssert("subdir/".ensureRight("/") == "subdir/")
        XCTAssert("subdir".ensureRight("/") == "subdir/")
    }
    
    func testIndexOf() {
        XCTAssert("hello".indexOf("hell") == 0)
        XCTAssert("hello".indexOf("lo") == 3)
        XCTAssert("hello".indexOf("world") == nil)
    }
    
    func testInitials() {
        XCTAssert("First".initials() == "F")
        XCTAssert("First Last".initials() == "FL")
        XCTAssert("First Middle1 Middle2 Middle3 Last".initials() == "FMMML")
    }
    
    func testInitialsFirstAndLast() {
        XCTAssert("First Last".initialsFirstAndLast() == "FL")
        XCTAssert("First Middle1 Middle2 Middle3 Last".initialsFirstAndLast() == "FL")
    }
    
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
    
    func testIsEmpty() {
        XCTAssert("".isEmpty() == true)
        XCTAssert(" ".isEmpty() == true)
        XCTAssert("\t\t\t ".isEmpty() == true)
        XCTAssert("\n\n".isEmpty() == true)
        XCTAssert("helo".isEmpty() == false)
    }
    
    func testIsNumeric() {
        XCTAssert("abc".isNumeric() == false)
        XCTAssert("123a".isNumeric() == false)
        XCTAssert("1".isNumeric() == true)
        XCTAssert("22".isNumeric() == true)
        XCTAssert("33.0".isNumeric() == true)
        XCTAssert("-63.0".isNumeric() == true)
    }
    
    func testJoin() {
        XCTAssert(",".join([1,2,3]) == "1,2,3")
        XCTAssert(",".join([]) == "")
        XCTAssert(",".join(["a","b","c"]) == "a,b,c")
        XCTAssert("! ".join(["hey","who are you?"]) == "hey! who are you?")
    }
    
    func testLatinize() {
        XCTAssert("šÜįéïöç".latinize() == "sUieioc")
        XCTAssert("crème brûlée".latinize() == "creme brulee")
    }
    
    func testLines() {
        XCTAssert("test".lines() == ["test"])
        XCTAssert("test\nsentence".lines() == ["test", "sentence"])
        XCTAssert("test \nsentence".lines() == ["test ", "sentence"])
        //Test Carriage return instead of just newlines
        XCTAssert("test\rsentence".lines() == ["test", "sentence"])
    }

    func testPad() {
        XCTAssert("hello".pad(2) == "  hello  ")
        XCTAssert("hello".pad(1, "\t") == "\thello\t")
    }
    
    func testPadLeft() {
        XCTAssert("hello".padLeft(10) == "          hello")
        XCTAssert("what?".padLeft(2, "!") == "!!what?")
    }
    
    func testPadRight() {
        XCTAssert("hello".padRight(10) == "hello          ")
        XCTAssert("hello".padRight(2, "!") == "hello!!")
    }
    
    func testStartsWith() {
        XCTAssert("hello world".startsWith("hello") == true)
        XCTAssert("hello world".startsWith("foo") == false)
    }
    
    func testSplit() {
        XCTAssert("hello world".split(" ")[0] == "hello")
        XCTAssert("hello world".split(" ")[1] == "world")
        XCTAssert("helloworld".split(" ")[0] == "helloworld")
    }
    
    func testTimes() {
        XCTAssert("hi".times(3) == "hihihi")
        XCTAssert(" ".times(10) == "          ")
    }
    
    func testTrimmedLeft() {
        XCTAssert("        How are you? ".trimmedLeft() == "How are you? ")
    }
    
    func testTrimmedRight() {
        XCTAssert(" How are you?   ".trimmedRight() == " How are you?")
    }
    
    func testTrimmed() {
        XCTAssert("    How are you?   ".trimmed() == "How are you?")
        //Added per Issue #9 - https://github.com/amayne/SwiftString/issues/9
        XCTAssert(" ".trimmed().characters.count == 0)
        XCTAssert("  ".trimmed().characters.count == 0)
        XCTAssert("   ".trimmed().characters.count == 0)
    }
    
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
    
    func testSlugify() {
        XCTAssert("Global Thermonuclear Warfare".slugify() == "global-thermonuclear-warfare")
        XCTAssert("Global Thermonuclear Warfare".slugify(withSeparator: "_") == "global_thermonuclear_warfare")
        XCTAssert("Crème brûlée".slugify() == "creme-brulee")
    }
    
    func testStripPunctuation() {
        XCTAssert("My, st[ring] *full* of %punct)".stripPunctuation() == "My string full of punct")
    }
    
    func testSubstring() {
        let subject = "hello world"
        XCTAssert(subject.substring(0, length: 1) == "h")
        XCTAssert(subject.substring(0, length: 11) == "hello world")
    }
    
    func testSubscripts() {
        let subject = "hello world"
        XCTAssert(subject[0...1] == "he")
        XCTAssert(subject[0..<1] == "h")
        XCTAssert(subject[0] == "h")
        XCTAssert(subject[0...10] == "hello world")
    }
    
}
