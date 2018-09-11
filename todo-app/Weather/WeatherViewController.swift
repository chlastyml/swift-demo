//
//  WeatherViewController.swift
//  todo-app
//
//  Created by kacalek on 11/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class WeatherViewController: UIViewController {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var lastUpdateInfoLabel: UILabel!
    
    @IBOutlet weak var weatherConditionsImage: UIImageView!
    
    let weatherInfoProvider = WeatherInfoProvider()
    let userDefaultsHelper = UserDefaultsHelper()
    let storageHelper = StorageHelper()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUI()
        
        locationManager.delegate = self
        
        initLocationServices()
        
        NotificationCenter.default.addObserver(self, selector:#selector(initLocationServices), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWeatherData(latitude: Double, longitude: Double) {
        resetUI()
        
        if Alamofire.NetworkReachabilityManager()?.isReachable ?? false {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            weatherInfoProvider.getCurrentWeatherInfo(latitude: latitude, longitude: longitude) { newWeatherInfo in
                if let newWeatherInfo = newWeatherInfo {
                    self.updateUIWithWeatherInfo(newWeatherInfo)
                    self.userDefaultsHelper.saveWeatherInfo(weatherInfo: newWeatherInfo)
                    self.lastUpdateInfoLabel.text = "Last update: Now"
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        } else {
            if savedDataIsLessThanThreeHoursOld() {
                if let savedWeatherInfo = userDefaultsHelper.loadWeatherInfo() {
                    updateUIWithWeatherInfo(savedWeatherInfo)
                    let timeDateFormatter = DateFormatter()
                    timeDateFormatter.dateFormat = "HH:mm"
                    lastUpdateInfoLabel.text = "Last update: \(timeDateFormatter.string(from: userDefaultsHelper.getLastUpdateTime()!))"
                    weatherConditionsImage.image = storageHelper.loadImage()
                }
            }
        }
    }
    
    func savedDataIsLessThanThreeHoursOld() -> Bool {
        let lastUpdateDate = userDefaultsHelper.getLastUpdateTime()
        
        if let lastUpdateDate = lastUpdateDate {
            return Date().timeIntervalSince(lastUpdateDate) < THREE_HOURS_IN_SECONDS
        }
        
        return false
    }
    
    let THREE_HOURS_IN_SECONDS: Double = 60 * 60 * 3
    
    func updateUIWithWeatherInfo(_ newWeatherInfo: WeatherInfo) {
        temperatureLabel.text = "\(newWeatherInfo.temperature)°"
        pressureLabel.text = "\(newWeatherInfo.pressure) hPa"
        humidityLabel.text = "\(newWeatherInfo.humidity) %"
        updateWeatherImage(imageUrl: newWeatherInfo.imageUrl)
    }
    
    func resetUI() {
        temperatureLabel.text = "-°"
        pressureLabel.text = "- hPa"
        humidityLabel.text = "- %"
        weatherConditionsImage.image = nil
    }
    
    func updateWeatherImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        let imageData = try? Data(contentsOf: url)
        
        if let imageData = imageData {
            let newWeatherConditionsImage = UIImage(data: imageData)
            weatherConditionsImage.image = newWeatherConditionsImage
            storageHelper.saveImage(image: newWeatherConditionsImage)
        }
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    
    @objc func initLocationServices() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let lat = locations.last?.coordinate.latitude, let lon = locations.last?.coordinate.longitude {
            updateWeatherData(latitude: Double(lat), longitude: Double(lon))
            
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}






