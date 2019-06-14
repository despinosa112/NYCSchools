//
//  ScoreSetTest.swift
//  NewYorkSchoolsTests
//
//  Created by Daniel Espinosa on 6/13/19.
//  Copyright © 2019 Daniel Espinosa. All rights reserved.
//

import XCTest
@testable import NewYorkSchools


class ScoreSetTest: XCTestCase {

    var scoreSetsResponse = "[{\"dbn\": \"01M292\", \"school_name\": \"HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES\", \"num_of_sat_test_takers\": \"29\", \"sat_critical_reading_avg_score\": \"355\",\"sat_math_avg_score\": \"404\", \"sat_writing_avg_score\": \"363\"}]"
    var scoreSets: [ScoreSet]?
    
    var emptyResponse = "[{}]"
    var emptyScoreSets: [ScoreSet]?
 
    override func setUp() {
        super.setUp()
        setupData()
    }
    
    func setupData(){
        //This is setting up a valid scoreSets response
        do {
            let scoreSets = try JSONDecoder().decode([ScoreSet].self, from: Data(scoreSetsResponse.utf8))
            self.scoreSets = scoreSets
        } catch {
            print("ERROR: not able to decode scoreSets")
        }
        
        //This is setting up an empty response
        do {
            let emptyScoreSets = try JSONDecoder().decode([ScoreSet].self, from: Data(emptyResponse.utf8))
            self.emptyScoreSets = emptyScoreSets
        } catch {
            print("ERROR: not able to decode schoolsResponse")
        }

    }
    
    func testAbleToDecodeScoreSetsResponse(){
        let actualScoreSets = self.scoreSets
        if actualScoreSets != nil {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testMathScore(){
        let expectedMathScore = "404"
        let actualMathScore = self.scoreSets![0].sat_math_avg_score!
        XCTAssertEqual(expectedMathScore, actualMathScore)
        
    }
    
    func testWritingScore(){
        let expectedWritingScore = "363"
        let actualWritingScore = self.scoreSets![0].sat_writing_avg_score!
        XCTAssertEqual(expectedWritingScore, actualWritingScore)
    }
    
    func testReadingScore(){
        let expectedReadingScore = "355"
        let actualReadingScore = self.scoreSets![0].sat_critical_reading_avg_score!
        XCTAssertEqual(expectedReadingScore, actualReadingScore)
    }
    
    func testAbleToDecodeEmptyScoreSetsResponse(){
        let actualEmptyScoreSets = self.emptyScoreSets
        if actualEmptyScoreSets != nil {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
}

