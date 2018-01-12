//
//  RestaurantPage.swift
//  RestaurangGuiden
//
//  Created by Sten R Kaiser on 2018-01-10.
//  Copyright © 2018 Kaiser&Kaiser. All rights reserved.
//

import UIKit

class RestaurantPage: UIViewController {
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restImg: UIImageView!
    @IBOutlet weak var restAdress: UILabel!
    @IBOutlet weak var restTel: UILabel!
    @IBOutlet weak var restAbout: UITextView!
    
    var currRestaurant:Restaurants?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currRestaurant = currRestaurant {
            restName.text = currRestaurant.name
            restAdress.text = currRestaurant.adress
            restTel.text = "Tel: " + currRestaurant.tel
            restAbout.text = currRestaurant.about
            restImg.image = UIImage(named: currRestaurant.img)
        }
    }

    @IBAction func makeCall() {
         if let currRestaurant = currRestaurant {
            var number = currRestaurant.tel.replacingOccurrences(of: "-", with: "")
            number = number.replacingOccurrences(of: " ", with: "")
            guard let numurl = URL(string: "tel://" + number) else { return }
            UIApplication.shared.open(numurl, options: [:], completionHandler: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapOne" {
            if let mapPage = segue.destination as? MapPage {
                mapPage.address = (currRestaurant?.adress)!
                mapPage.name = (currRestaurant?.name)!

        }
    }

    }
}
