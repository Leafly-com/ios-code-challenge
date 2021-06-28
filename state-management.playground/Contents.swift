import UIKit
import XCTest

protocol StateStore {
    associatedtype State
    func registerListener(_ listener: @escaping (State) -> Void)
    func updateState(_ action: @escaping (State) -> State)
}


// MARK: - Test

class StateStoreTest: XCTestCase {
    func test_updates_state_sequentially() {
         // let state: String = ""
         // let store = TBD

         // var states: [String] = []
         // store.registerListener { state in
         //     states.append(state)
         // }

         // let queue = DispatchQueue(label: "test", attributes: .concurrent)
         // queue.async {
         //     store.updateState { oldState in
         //         return oldState + "Hello"
         //     }
         // }

         // queue.async {
         //     store.updateState { oldState in
         //         return oldState + "World"
         //     }
         // }
         // sleep(1)

         // XCTAssertTrue(states[0] == "Hello", "Expected to equal 'Hello', got \(states[0])")
         // XCTAssertTrue(states[1] == "HelloWorld", "Expected to equal 'HelloWorld', got \(states[1])")
    }
}

StateStoreTest.defaultTestSuite.run()
