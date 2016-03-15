
import XCTest
@testable import SwiftyExt

class DelayTests: XCTestCase {
    
    func testDelay() {
        let task = delay(5) {
            XCTAssert(true, "delay")
        }
        cancle(task)
    }
    
}
