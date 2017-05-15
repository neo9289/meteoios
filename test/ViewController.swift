//
//  ViewController.swift
//  test
//
//  Created by Francesco Luise on 04/02/17.
//  Copyright © 2017 Francesco Luise. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var dataOdierna: UILabel!
    @IBOutlet weak var temperaturaOdierna: UILabel!
    @IBOutlet weak var posizioneOdierna: UILabel!
    @IBOutlet weak var imgMeteo: UIImageView!
    @IBOutlet weak var meteoAttuale: UILabel!
    @IBOutlet weak var meteoFuturoTable: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    var meteoResponse: meteoResconce!
    var meteoFuturoVar: meteoFuturo!
    var meteoFuturoArray = [meteoFuturo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        meteoFuturoTable.delegate = self
        meteoFuturoTable.dataSource = self
        meteoResponse = meteoResconce()
        //meteoFuturoVar = meteoFuturo ()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meteoFuturoArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "meteocell", for: indexPath) as? WeatherCell
        {
            cell.ConfiguraCella(cella: meteoFuturoArray[indexPath.row])
            return cell
        }
        else
        {
            return WeatherCell()
        }
        
    }
    
    func updateMainUI() {
        dataOdierna.text = meteoResponse.date
        posizioneOdierna.text = meteoResponse.cityName
        print(meteoResponse.cityName)
        temperaturaOdierna.text = "\(meteoResponse.currentTemp)"
        meteoAttuale.text = meteoResponse.weatherType
        imgMeteo.image = UIImage(named: meteoResponse.weatherType)
    }
    
    func meteoFuturoDownload(complete:  DownloadCompete) {
        let forecastURL = URL(string: FUTUR_WEATHER_URL)!
        //print(forecastURL)
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject>
            {
                if let list = dict["list"] as? [Dictionary<String,AnyObject>]
                {
                    for obj in list
                    {
                        let forecast = meteoFuturo(meteoProssiniGiorni: obj)
                        self.meteoFuturoArray.append(forecast)
                        print(obj)
                    }
                    self.meteoFuturoTable.reloadData()
                }
            }
            self.updateMainUI()
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }

    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse
        {
            print(currentLocation.coordinate.latitude,currentLocation.coordinate.longitude)
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            print(Location.sharedInstance.latitude,Location.sharedInstance.longitude)
            meteoResponse.downloadWeatherDetail{
                self.meteoFuturoDownload{
                    
                }
            }
            
        }
        else
        {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }

}

