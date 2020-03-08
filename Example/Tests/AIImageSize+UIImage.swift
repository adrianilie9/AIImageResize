import XCTest

@testable import AIImageResize

class AIImageResize_UIImage: XCTestCase {
    func testResize() {
        guard let image = UIImage(named: "bucharest.jpg") else {
            XCTAssertTrue(false)
            return
        }
        
        guard let i1 = image.resize(toSize: CGSize(width: 200.0, height: 100.0)) else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertEqual(i1.size.width, 200.0)
        XCTAssertEqual(i1.size.height, 100.0)
        
        guard let i2 = image.resize(toWidth: 200.0) else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertEqual(i2.size.width, 200.0)
        XCTAssertEqual(i2.size.height, 124.0)
        
        guard let i3 = image.resize(toHeight: 124.0) else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertEqual(i3.size.width, 201.0)
        XCTAssertEqual(i3.size.height, 124.0)
        
        guard let i4 = image.resizeToFit(inSize: CGSize(width: 200.0, height: 100.0)) else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertEqual(i4.size.width, 162.0)
        XCTAssertEqual(i4.size.height, 100.0)
    }
    
    func testCrop() {
        guard let image = UIImage(named: "bucharest.jpg") else {
            XCTAssertTrue(false)
            return
        }
        
        guard let i1 = image.crop(inRect: CGRect(x: 100.0, y: 200.0, width: 500.0, height: 450.0)) else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertEqual(i1.size.width, 500.0)
        XCTAssertEqual(i1.size.height, 450.0)
    }
}
