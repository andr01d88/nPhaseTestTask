//
//  nPhaseTestProjectTests.swift
//  nPhaseTestProjectTests
//
//  Created by Andrew Koryagin on 25.10.24.
//

import XCTest
@testable import nPhaseTestProject

final class nPhaseTestProjectTests: XCTestCase {
    
    let userJSON = """
{
  "age" : 30,
  "email" : "john.doe@example.com",
  "interests" : [
    {
      "interest_name" : "Music"
    },
    {
      "interest_name" : "Sports"
    }
  ],
  "name" : "John Doe"
}
"""
    func testUserSerialization() throws {
        let interests = [Interest(interestName: "Music"), Interest(interestName: "Sports")]
        let user = User(name: "John Doe", email: "john.doe@example.com", age: 30, interests: interests)
        let expectation = self.expectation(description: "SerializeUser")
        let userSerializationService = UserSerializationService()
        
        userSerializationService.serializeUser(user) { jsonString, error in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(jsonString, "jsonString should not be nil")
            
            let expectedJSONString = self.userJSON
            XCTAssertEqual(jsonString, expectedJSONString, "The JSON string should match the expected JSON string")
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testUserDeserialization() throws {
        let expectation = self.expectation(description: "DeserializeUser")
        let userSerializationService = UserSerializationService()
        
        userSerializationService.deserializeUser(fromJSON: userJSON) { user, error in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(user, "User should not be nil")
            
            XCTAssertEqual(user?.name, "John Doe", "The user's name should be 'John Doe'")
            XCTAssertEqual(user?.age, 30, "The user's age should be 30")
            XCTAssertEqual(user?.email, "john.doe@example.com", "The user's email should be 'john.doe@example.com'")
            XCTAssertEqual(user?.interests.count, 2, "The user should have 2 interests")
            XCTAssertEqual(user?.interests[0].interestName, "Music", "The first interest should be 'Music'")
            XCTAssertEqual(user?.interests[1].interestName, "Sports", "The second interest should be 'Sports'")
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
