import XCTest

class StringHTMLTests: XCTestCase {

    func testDecodeHTML() {
        XCTAssert("The Weekend &#8216;King Of The Fall&#8217;".decodeHTML() == "The Weekend ‘King Of The Fall’", "decodeHTML")
        XCTAssert("<strong> 4 &lt; 5 &amp; 3 &gt; 2 .</strong> Price: 12 &#x20ac;.  &#64; ".decodeHTML() == "<strong> 4 < 5 & 3 > 2 .</strong> Price: 12 €.  @ ", "decodeHTML")
        XCTAssert("this is so &quot;good&quot;".decodeHTML() == "this is so \"good\"", "decodeHTML")
    }

}
