//
//  ViewController.swift
//  testAPI
//
//  Created by Gustavo da Silva Braghin on 26/08/21.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let url = URL(string: "https://corona.lmao.ninja/v2/countries/Brazil"){
            URLSession.shared.dataTask(with: url) {data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        print(res)
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
        
    }
    
    struct Response: Codable{
        let country: String
        let cases: Int
        let deaths: Int
        let recovered: Int
        let countryInfo: CountryInfo
    }
    
    struct CountryInfo: Codable{
        let iso2: String
        let iso3: String
    }

}
