import UIKit
import XCTest

/// An action is an operation that will modify the previous state and return a new state.
typealias Action = (_ action: String) -> String

/// A callback that will be triggered whenever the state changes.
typealias StateListener = (_ newState: String) -> Void

/// A store maintains & manages an instance of the state.
class Store {
    init(_ state: String) {

    }

    func registerListener(_ listener: @escaping StateListener) {

    }

    func updateState(_ action: @escaping Action) {

    }
}


// MARK: - Test

class StateStoreTest: XCTestCase {
    func test_updates_state_sequentially() {
          let state: String = ""
          let store = Store(state)

          var states: [String] = []
          store.registerListener { state in
              states.append(state)
          }

          let queue = DispatchQueue(label: "test", attributes: .concurrent)
          queue.async {
              store.updateState { oldState in
                  return oldState + "Hello"
              }
          }

          queue.async {
              store.updateState { oldState in
                  return oldState + "World"
              }
          }
          sleep(1)

          XCTAssertTrue(states[0] == "Hello", "Expected to equal 'Hello', got \(states[0])")
          XCTAssertTrue(states[1] == "HelloWorld", "Expected to equal 'HelloWorld', got \(states[1])")
    }
}

StateStoreTest.defaultTestSuite.run()
