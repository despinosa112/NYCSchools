//
//  SchoolTest.swift
//  NewYorkSchoolsTests
//
//  Created by Daniel Espinosa on 6/13/19.
//  Copyright © 2019 Daniel Espinosa. All rights reserved.
//

import XCTest
@testable import NewYorkSchools

class SchoolTest: XCTestCase {
    
    var schoolsResponse = "[{\"dbn\": \"02M260\", \"school_name\": \"Clinton School Writers & Artists, M.S. 260\", \"primary_address_line_1\": \"10 East 15th Street\"}]"
    var schools: [School]?
    
    var emptyResponse = "[{}]"
    var emptySchools: [School]?
    
    override func setUp() {
        super.setUp()
        setupData()
    }
    
    func setupData(){
        //This is setting up a valid schools response
        do {
            let schools = try JSONDecoder().decode([School].self, from: Data(schoolsResponse.utf8))
            self.schools = schools
        } catch {
            print("ERROR: not able to decode schoolsResponse")
        }
        
        //This is setting up an empty response
        do {
            let emptySchools = try JSONDecoder().decode([School].self, from: Data(emptyResponse.utf8))
            self.emptySchools = emptySchools
        } catch {
            print("ERROR: not able to decode schoolsResponse")
        }
    }
    
    func testAbleToDecodeSchoolsResponse(){
        let actualSchools = self.schools
        if actualSchools != nil {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testDBN(){
        let expectedDBN = "02M260"
        let actualDBN = self.schools![0].dbn!
        XCTAssertEqual(expectedDBN, actualDBN)

    }
    
    func testSchoolName(){
        let expectedSchoolName = "Clinton School Writers & Artists, M.S. 260"
        let actualSchoolName = self.schools![0].school_name!
        XCTAssertEqual(expectedSchoolName, actualSchoolName)
    }
    
    func testAddress(){
        let expectedAddress = "10 East 15th Street"
        let actualAddress = self.schools![0].primary_address_line_1!
        XCTAssertEqual(expectedAddress, actualAddress)
    }
    
    func testAbleToDecodeEmptySchoolsResponse(){
        let actualEmptySchools = self.emptySchools
        if actualEmptySchools != nil {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
}

