//
//  UserDefaultsHelper.swift
//  todo-app
//
//  Created by kacalek on 11/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class UserDefaultsHelper {
    let userDefaults = UserDefaults.standard
    
    func saveWeatherInfo(weatherInfo: WeatherInfo) {
        userDefaults.set(weatherInfo.temperature, forKey: TEMPERATURE_USER_DEFAULTS)
        userDefaults.set(weatherInfo.humidity, forKey: HUMIDITY_USER_DEFAULTS)
        userDefaults.set(weatherInfo.pressure, forKey: PRESSURE_USER_DEFAULTS)
        userDefaults.setValue(weatherInfo.imageUrl, forKey: IMAGE_ICON_USER_DEFAULTS)
        userDefaults.set(Date(), forKey: LAST_UPDATE_TIME_USER_DEFAUTLS)
    }
    
    func loadWeatherInfo() -> WeatherInfo? {
        if let temp = userDefaults.object(forKey: TEMPERATURE_USER_DEFAULTS) as? Int,
            let humidity = userDefaults.object(forKey: HUMIDITY_USER_DEFAULTS) as? Int,
            let pressure = userDefaults.object(forKey: PRESSURE_USER_DEFAULTS) as? Int,
            let imageCode = userDefaults.object(forKey: IMAGE_ICON_USER_DEFAULTS) as? String {
            return WeatherInfo(temperature: temp, pressure: pressure, humidity: humidity, imageUrl: WeatherInfoProvider.createImageUrl(imageCode: imageCode))
        }
        
        return nil
    }
    
    func getLastUpdateTime() -> Date? {
        return userDefaults.object(forKey: LAST_UPDATE_TIME_USER_DEFAUTLS) as? Date
    }
}
