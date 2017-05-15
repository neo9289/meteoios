//
//  Location.swift
//  test
//
//  Created by Francesco Luise on 18/02/17.
//  Copyright © 2017 Francesco Luise. All rights reserved.
//

import CoreLocation


class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude : Double!
    var longitude : Double!
    
}
