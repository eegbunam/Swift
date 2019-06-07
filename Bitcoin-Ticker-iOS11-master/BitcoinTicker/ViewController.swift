//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController , UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let symbols = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""
    var currencySelected = ""
    
 

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       currencyPicker.delegate  = self
       currencyPicker.dataSource = self
        
        
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(currencyArray[row])
        
        finalURL = baseURL + currencyArray[row]
        currencySelected = symbols[row]
        
        getBitcoinDta(url: finalURL)
        
        //print(finalURL)   ; to debug
    }
    //TODO: Place your 3 UIPickerView delegate methods here
    
    
    

    
    
    
//    
//    //MARK: - Networking
//    /***************************************************************/
    
    func getBitcoinDta(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the bitCoin data")
                    let bitCoinJSON : JSON = JSON(response.result.value!)
                    //print(bitCoinJSON)

                    self.updateCoinData(json: bitCoinJSON)

                } else {
                    //print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }

    }

    
    
    

    //MARK: - JSON Parsing
    /***************************************************************/
    
    func updateCoinData(json : JSON)
    {
        
        if let coinResult = json["ask"].double
        {
            
            bitcoinPriceLabel.text =   String(currencySelected) + String(coinResult)
        }

        else
        {
            bitcoinPriceLabel.text = "No value"
            
        }
        
       
   }
}
