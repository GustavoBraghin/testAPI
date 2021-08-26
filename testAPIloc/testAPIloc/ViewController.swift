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
                        //CÓDIGO ABAIXO COMENTADO POIS O USERDEFAULT JA FOI DEFINIDO E ARMAZENADO
                        //UserDefaults.standard.set(res.country, forKey: "country")
                        if let userCountry = UserDefaults.standard.value(forKey: "country"){
                            print(userCountry)
                        }
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
