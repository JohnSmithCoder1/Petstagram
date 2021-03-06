//
//  JsonData.swift
//  PetstagramTests
//
//  Created by J S on 8/11/21.
//

import Foundation

enum JsonData {
    static let goodFeed = """
    [
        {
            "id": "43C5322C-ACB0-4A10-90A5-69BE4C769ED1",
            "createdAt": "2020-04-01T12:00:00Z",
            "caption": "Living her best life! #corgi #puppyStyle",
            "createdByUser": "corgistuff"
        },
        {
            "id": "81B88642-59B3-4242-BE25-4B61F57E3965",
            "createdAt": "2020-03-11T04:44:00Z",
            "caption": "Bath time is best time!",
            "createdByUser": "petcare47"
        },
        {
            "id": "3452745A-CDFC-41B9-9604-40EA61CF8A06",
            "createdAt": "2020-01-03T17:32:00Z",
            "caption": "Not sure if alien or dog...",
            "createdByUser": "truthisoutthere"
        }
    ]
    """
    
    static let badJson = """
    [
        "bad json"
    ]
    """
    
    static let goodSignUp = """
    {
      "username": "username",
      "email": "email@example.com"
    }
    """
    
    static let postUploaded = """
    {
      "id": "7D1EA5FA-3BB0-4CE4-AADB-DCCA549D3F51",
      "createdAt": "2020-09-03T12:00:00Z",
      "caption": "Dummy description",
      "createdByUser": "Jerry"
    }
    """
}
