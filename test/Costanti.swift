//
//  Costanti.swift
//  test
//
//  Created by Francesco Luise on 05/02/17.
//  Copyright © 2017 Francesco Luise. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let BASE_URL_FUTURE = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "9d95cee4da9aff3ef66627d72ff5cbfa"
let DAY_STRING = "&cnt="
let DAY = 10
let MODE = "&mode=json"



typealias DownloadCompete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
let FUTUR_WEATHER_URL = "\(BASE_URL_FUTURE)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(DAY_STRING)\(DAY)\(MODE)\(APP_ID)\(API_KEY)"


