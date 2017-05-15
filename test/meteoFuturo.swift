//
//  meteoFuturo.swift
//  test
//
//  Created by Francesco Luise on 11/02/17.
//  Copyright © 2017 Francesco Luise. All rights reserved.
//

import UIKit
import Alamofire

class meteoFuturo{
    
    var _date : String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType: String{
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String{
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String{
        if _lowTemp == nil{
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(meteoProssiniGiorni: Dictionary<String,AnyObject>) {
        if let temp = meteoProssiniGiorni["temp"] as? Dictionary<String,AnyObject>
        {
            if let min = temp["min"] as? Double
            {
                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self._lowTemp = "\(kelvinToFarenheit)"
            }
            if let max = temp["max"] as? Double
            {
                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self._highTemp = "\(kelvinToFarenheit)"
            }
        }
        if let weather = meteoProssiniGiorni["weather"] as? [Dictionary<String,AnyObject>]
        {
            if let main = weather[0]["main"] as? String
            {
                self._weatherType = main
            }
        }
        if let date = meteoProssiniGiorni["dt"] as? Double{
            let unixConvertDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertDate.dayOfTheWeek()
        }
    }
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
