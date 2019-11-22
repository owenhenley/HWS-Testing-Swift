import Foundation
import XCTest

//func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
//    let quotient = number / dividedBy
//    let remainder = number % dividedBy
//    return (quotient, remainder)
//}
//
//func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
//    XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
//    XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
//}
//
//func testDivisors() {
//    // given
//    let dividend = 10
//    let divisor = 3
//
//    // when
//    let result = divisionRemainder(of: dividend, dividedBy: divisor)
//
//    // then
//    verifyDivision(result, expectedQuotient: 3, expectedRemainder: 2)
//}

//class Tests: XCTestCase {
//    func testThreeIngredientCakeCosts9() {
//        // given
//        let cake = Cake()
//        let ingredients = ["chocolate", "cherries", "frosting"]
//        // when
//        let cost = cake.bake(ingredients: ingredients)
//        // then
//        XCTAssertEqual(cost, 10)
//    }
//}


//struct Cake {
//    func bake(ingredients: [String]) -> Int {
//
//        for ingredient in ingredients {
//            print("Adding \(ingredient).")
//        }
//
//        let cost = 1 + (ingredients.count * 3)
//        print("The cake is ready; please pay \(cost).")
//        return 10 // mutation, test will pass, but doesnt mee the code is working
//    }
//}

// MARK: - Dependency Injection

//protocol AppProtocol {
//    var price: Decimal { get set }
//    var minimumAge: Int { get set }
//    var isReleased: Bool { get set }
//
//    func canBePurchased(by user: UserProtocol) -> Bool
//    static func printTerms()
//}
//
//extension AppProtocol {
//    static func printTerms() {
//        print("Here are 50 pages of terms and conditions for you to read on a tiny phone screen.")
//    }
//}
//
//struct App: AppProtocol {
//
//    var price: Decimal
//    var minimumAge: Int
//    var isReleased: Bool
//
//    func canBePurchased(by user: UserProtocol) -> Bool {
//
//        guard isReleased else {
//            return false
//        }
//
//        guard user.funds >= price else {
//            return false
//        }
//
//        if user.age >= minimumAge {
//            return true
//        } else {
//            return false
//        }
//    }
//}
//
//protocol UserProtocol {
//    var funds: Decimal { get set }
//    var age: Int { get set }
//    var apps: [AppProtocol] { get set }
//
//    mutating func buy(_ app: AppProtocol) -> Bool
//}
//
//struct User: UserProtocol {
//
//    var funds: Decimal
//    var age: Int
//    var apps: [AppProtocol]
//
//    mutating func buy(_ app: AppProtocol) -> Bool {
//        let possible = app.canBePurchased(by: self)
//        type(of: app).printTerms()
//
//        if possible {
//            apps.append(app)
//            funds -= app.price
//            return true
//        } else {
//            return false
//        }
//    }
//}
//
//func testCanBePurchacedIsFalse_WhenNotReleased() {
//    struct UnreleasedAppStub: AppProtocol {
//        // A minimal implementation of the protocol, with hard-coded values that make it do a specific thing. - A stub
//        var price: Decimal = 0
//        var minimumAge = 0
//        var isReleased = false
//
//        func canBePurchased(by user: UserProtocol) -> Bool { false }
//    }
//
//    // given
//    var sut = User(funds: 100, age: 21, apps: [])
//    let app = UnreleasedAppStub()
//
//    // when
//    let wasBought = sut.buy(app)
//
//    // then
//    XCTAssertFalse(wasBought)
//}
//
////testCanBePurchacedIsFalse_WhenNotReleased()

// MARK: - Injection

// Best practice
//struct Tweet {
//    let text: String
//    let author: String
//    let date: Date
//
//    init(text: String, author: String, date: Date = Date()) {
//        self.text = text
//        self.author = author
//        self.date = date
//    }
//}
    
    // MARK: - Injecting closures
    
//class ShareView: UIView {
//    var shareAction: (String) -> Void
//    var textField: UITextField!
//
//    init(shareAction: @escaping (String) -> Void) {
//        self.shareAction = shareAction
//        super.init(frame: .zero)
//
//        let textField = UITextField()
//        textField.sizeAndPositionHoweverYouWant()
//        addSubview(textField)
//
//        let button = UIButton(type: .system)
//        button.sizeAndPositionHoweverYouWant()
//        button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
//
//        addSubview(textField)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) is not supported.")
//    }
//
//    @objc func shareTapped() {
//        guard let text = textField.text else {
//            return
//        }
//        shareAction(text)
//    }
//}


//class ShareViewController: UIViewController {
//    override func loadView() {
//        view = ShareView { [weak self] in
//            self?.shareContent(text: $0)
//        }
//    }
//
//    func shareContent(text: String) {
//        print("Sharing text...")
//    }
//}

//struct URLHandler {
////    let application: ApplicationProtocol
////    let urlOpener: URLOpening = UIApplication.shared.open // typealias
//    let urlOpener: (URL, [UIApplication.OpenExternalURLOptionsKey: Any], ((Bool) -> Void)?) -> Void = UIApplication.shared.open
//
//    func open(url: URL) {
//        if url.absoluteString.hasPrefix("internal://") {
//            // run some app-specific code
//        } else {
//            application.open(url, options: [:], completionHandler: nil)
//        }
//    }
//}

// TypeAlias?
//typealias URLOpening = (URL, [UIApplication.OpenExternalURLOptionsKey: Any], ((Bool) -> Void)?) -> Void

// Rather than creating an ApplicationProtocol protocol, making UIApplication conform to it, building
// a test double and making that conform to it, then adding an ApplicationProtocol property to our
// type, we can just make URLHandler have a single property specifying what code should be run to open external URLs


// Not needed!
//protocol ApplicationProtocol {
//    func open(_ url: URL,
//              options: [UIApplication.OpenExternalURLOptionsKey: Any],
//              completionHandler completion: ((Bool) -> Void)?)
//}

//extension UIApplication: ApplicationProtocol { }

// MARK: - Injecting Everything

// Basically, dont do it. - “many client-specific interfaces are better than one general-purpose interface”

//struct Dependencies {
//    var singleton1: SomeThing
//    var singleton2: SomeOtherThing
//    var singleton3: AThirdThing
//    var singleton4: AFourthThing
//    var singleton5: AFifthThing
//    var singleton6: ASixthThing
//}

//struct StagingDependencies {
//    var singletonDouble1: SomeThing
//    var singletonDouble2: SomeOtherThing
//    var singletonDouble3: AThirdThing
//    var singletonDouble4: AFourthThing
//    var singletonDouble5: AFifthThing
//    var singletonDouble6: ASixthThing
//}

// MARK: - Mocking

//class Buyer {
//    func view(_ house: HouseProtocol) {
//        house.conductViewing() }
//}
//
//protocol HouseProtocol {
//    var numberOfViewings: Int { get set }
//    func conductViewing()
//}
//
//class House: HouseProtocol {
//    var numberOfViewings = 0
//
//    func conductViewing() {
//        numberOfViewings += 1
//    }
//}
//
//func testViewingHouseAddsOneToViewings() {
//    // given
//    let sut = House()
//    let startViewings = sut.numberOfViewings
//
//    // when
//    sut.conductViewing()
//
//    // then
//    XCTAssertEqual(sut.numberOfViewings, startViewings + 1)
//}
//
//func testBuyer() {
//    // given
//    let sut = Buyer()
//    let house = MockHouse()
//
//    // when
//    sut.view(house)
//
//    // then
////    XCTAssertEqual(house.numberOfViewings, 1)
//    XCTAssertEqual(house.conductViewingCallcount, 1)
//}
//
//class MockHouse: HouseProtocol {
//    var numberOfViewings = 0
//    var conductViewingCallcount = 0
//
//    func conductViewing() {
//        numberOfViewings += 1
//        conductViewingCallcount += 1
//    }
//}


// MARK: - Partial mocks vs full mocks

//struct PowerMonitor {
//    var device: UIDevice
//
//    func getStatus() -> String {
//        if UIDevice.current.batteryState == .unplugged {
//            return "Power is down"
//        } else if device.batteryState == .unknown {
//            return "Error"
//        } else {
//            return "Power is up"
//        }
//    }
//}
//
//func testUnpluggedDeviceShowsDown() {
//    // given
//    let sut = PowerMonitor(device: DeviceMockPartial(testBatteryState: .unplugged))
//
//    // when
//    let status = sut.getStatus()
//
//    // then
//    XCTAssertEqual(status, "Power is down")
//}
//
//// Partial Mock
//class DeviceMockPartial: UIDevice {
//    var testBatteryState: BatteryState
//
//    init(testBatteryState: BatteryState) {
//        self.testBatteryState = testBatteryState
//        super.init()
//    }
//
//    override var batteryState: BatteryState {
//        return testBatteryState
//    }
//}
//
//// That ^^^ replaces this vvv
//
////class UnpluggedDeviceMock: UIDevice {
////    override var batteryState: BatteryState {
////        return .unplugged
////    }
////}
////
////class UnknownDeviceMock: UIDevice {
////    override var batteryState: BatteryState {
////        return .unknown
////    }
////}
////class ChargingDeviceMock: UIDevice {
////    override var batteryState: BatteryState {
////        return .charging
////    }
////}
//
//// Full Mock
//protocol DeviceProtocol {
//    var batteryState: UIDevice.BatteryState { get }
//}
//
//extension UIDevice: DeviceProtocol { }
//
//struct DeviceMockFull: DeviceProtocol {
//    var testBatteryState: UIDevice.BatteryState
//    var batteryState: UIDevice.BatteryState {
//        return testBatteryState
//    }
//
//}
//
//struct PowerMonitorPartial {
//    var device: DeviceProtocol
//
//    func getStatus() -> String {
//        if device.batteryState == .unplugged {
//            return "Power is down"
//        } else if device.batteryState == .unknown {
//            return "Error"
//        } else {
//            return "Power is up" }
//    }
//}

// MARK: - Mocking preconditions and assertions

class User { }

class Store {
    var user: User?
    func buy(product: String) -> Bool {
        assert(user != nil, "We can't buy anything without a user.")
        print("The user bought \(product).")
        return true
    }
}

func testStoreBuyingWithoutUser() {
    // given
    let store = Store()
    
    // when
    let success = store.buy(product: "War of the Worlds")
    
    // then
    XCTAssertTrue(success)
}

// p.157
