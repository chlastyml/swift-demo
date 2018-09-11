//
//  WeatherInfoProvider .swift
//  todo-app
//
//  Created by kacalek on 11/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WeatherInfoProvider {
    func getCurrentWeatherInfo(latitude: Double, longitude: Double, completion: @escaping (WeatherInfo?) -> ()) {
        let requestUrl = createRequestUrl(latitude: latitude, longitude: longitude)
        
        Alamofire.request(requestUrl).responseJSON { response in
            if let data = response.data {
                let json = JSON(data)
                
                let temperature = json["main"]["temp"].intValue
                let humidity = json["main"]["humidity"].intValue
                let pressure = json["main"]["pressure"].intValue
                
                let imageCode = json["weather"][0]["icon"].stringValue
                
                completion(WeatherInfo(temperature: temperature, pressure: pressure, humidity: humidity, imageUrl: WeatherInfoProvider.createImageUrl(imageCode: imageCode)))
                
            }
            else {
                completion(nil)
            }
        }
        
        
    }
    
    static func createImageUrl(imageCode: String) -> String {
        return "https://openweathermap.org/img/w/\(imageCode).png"
    }
    
    private func createRequestUrl(latitude: Double, longitude: Double) -> String {
        return "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=metric&appid=\(API_KEY)"
    }
    
}
