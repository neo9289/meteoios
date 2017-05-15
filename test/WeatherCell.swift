//
//  WeatherCell.swift
//  test
//
//  Created by Francesco Luise on 16/02/17.
//  Copyright © 2017 Francesco Luise. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var WeatherImage: UIImageView!
    @IBOutlet weak var GiornoLabel: UILabel!
    @IBOutlet weak var metelLabel: UILabel!
    @IBOutlet weak var TempMaxLable: UILabel!
    @IBOutlet weak var MinTempLable: UILabel!

    
    func ConfiguraCella(cella: meteoFuturo) {
        GiornoLabel.text = cella.date
        metelLabel.text = cella.weatherType
        TempMaxLable.text = "\(cella.highTemp)"
        MinTempLable.text = "\(cella.lowTemp)"
        WeatherImage.image = UIImage(named: cella.weatherType)
    }


}
