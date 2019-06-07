//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class WeatherViewController: UIViewController , CLLocationManagerDelegate , ChangeCityDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?q="
    let APP_ID = "b06c18a6d6891e488063a85fa673d72a"
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    let weatherData = WeatherDataModel()
    

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    
        
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    
    func getWeatherData(url:String ,paramss:[String:String])
    {
        Alamofire.request(url , method: .get , parameters: paramss).responseJSON{
            
                response in
                if response.result.isSuccess{
                    
                    print("sucessfiul connection")
                    
                    let weatherJSON : JSON = JSON(response.result.value!)
                    print(weatherJSON)
                    self.updateWeatherData(json: weatherJSON)
                    
                }
                else{
                    print("Error \(String(describing: response.result.error))")
                    self.cityLabel.text = "Connection Issues"
                    
                }
        }
        
        
        
    }
    

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    
    func updateWeatherData( json:JSON)
    {
        if let temp = json["main"]["temp"].double{
        weatherData.temprature = Int(temp - 273.75)
        weatherData.city = json["name"].stringValue
        weatherData.condition = json["weather"][0]["id"].intValue
        weatherData.weatherIconName = weatherData.updateWeatherIcon(condition: weatherData.condition)
        updateUIWithWeatherData()
        }
        else{
            cityLabel.text = "Weather Unavailable"
        }
        
    }
    

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    func updateUIWithWeatherData(){
        cityLabel.text = weatherData.city
        temperatureLabel.text = String(weatherData.temprature)
        weatherIcon.image = UIImage(named: weatherData.weatherIconName)
        
    }
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count-1]
        if location.horizontalAccuracy > 0
        {
            locationManager.stopUpdatingLocation()
            print("latituide = \(location.coordinate.latitude) ,longitiude = \(location.coordinate.longitude)")
            let lattitude = String(location.coordinate.latitude)
            let longitiude = String(location.coordinate.longitude)
            
            let params : [String:String] = ["Lat" :lattitude, "lon": longitiude , "appid": APP_ID]
            getWeatherData( url : WEATHER_URL , paramss : params)
        }
    }
    
    
    
    //Write the didFailWithError method here:
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        cityLabel.text = "Location Unavailable"
    }
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    func userEnteredANewCityName(city:String){
        let params :[String:String] = ["city":city ,"APP_ID":APP_ID]
        getWeatherData(url: WEATHER_URL, paramss: params)
        
        
    }
    

    
    //Write the PrepareForSegue Method here
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName"
        {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
        }
    }
    
    
    
    
    
}


