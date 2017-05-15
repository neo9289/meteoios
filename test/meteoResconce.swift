//
//  meteoResconce.swift
//  test
//
//  Created by Francesco Luise on 05/02/17.
//  Copyright © 2017 Francesco Luise. All rights reserved.
//

import Foundation
import Alamofire

class meteoResconce{
    var _cityName : String!
    var _date : String!
    var _weatherType : String!
    var _currentTemp : Double!
    
    
    var cityName : String {
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var date : String {
        if _date == nil{
            _date = ""
        }
        
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .long
        dataFormatter.dateFormat = .none
        let currentDate = dataFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType : String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp : Double {
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetail(completed: @escaping DownloadCompete) {
        let url = URL(string : CURRENT_WEATHER_URL)!
        print("\(url)")
        Alamofire.request(url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temperature = main["temp"] as? Double {
                        let kelvinToFarenheitPreDivision = (temperature * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        self._currentTemp = kelvinToFarenheit
                    }
                }
            }
            completed()
        }
    }
    
}
