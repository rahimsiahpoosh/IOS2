//
//  ViewController.swift
//  RestaurangGuiden
//
//  Created by Sten R Kaiser on 2018-01-10.
//  Copyright © 2018 Kaiser&Kaiser. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var restaurantArray:[Restaurants] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nameArray = ["Lilla Ego", "Duck & Crab", "Sturehof", "Nook", "Frantzén"]
        let imgArray = ["lilla_ego", "duck_crab", "sturehof", "nook", "frantzen"]
        let telArray = ["08-274455", "08-209950", "08-4405730", "08-7021222", "08-208580"]
        let addressArray = ["Västmannagatan 69, 11326 Stockholm", "Rådmansgatan 23, 11425 Stockholm", "Sturegallerian 42, 11435 Stockholm", "Åsögatan 176, 11632 Stockholm", "Klara norra kyrkogata 26, 111 22 Stockholm"]
        let urlArray = ["http://www.lillaego.com/", "http://duckandcrab.com/", "http://www.sturehof.com/", "http://nookrestaurang.se/", "http://www.restaurantfrantzen.com/se/"]
        let aboutArray = ["Framgångsfenomenet Lilla Ego är en unik och lekfull kombination av anspråkslöshet och självsäkerhet.", "Pytteliten och supertrevlig gastropub som erbjuder just vad namnet antyder. Tillagningen och känslan är amerikansk och vinerna franska.", "Med uteserveringen självsäkert utsträckt över torget ligger ett av Stockholms mest klassiska vattenhål, där tv-kändisar och turister minglar med stekare, direktörer och vem som helst som uppskattar en perfekt anrättad torskrygg.", "Med nordisk melodi och koreanska ackord spelar Nook upp till finstämd smakkonsert utan att det kostar skjortan.", "För ett år sedan stängde Björn Frantzén sin tvåstjärniga restaurang i Gamla stan för att starta om på ny adress. Nu har nya Frantzén öppnat, ännu exklusivare än föregångaren."]
        
        for i in 0..<nameArray.count {
            var newRest = Restaurants()
            newRest.name = nameArray[i]
            newRest.img = imgArray[i]
            newRest.tel = telArray[i]
            newRest.adress = addressArray[i]
            newRest.url = urlArray[i]
            newRest.about = aboutArray[i]
            restaurantArray.append(newRest)
        }
    }
    
    // MARK: ------  Tabeller --------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restCell", for: indexPath) as! RestaurantCell
        let cellRest = restaurantArray[indexPath.row]
        cell.restName?.text = cellRest.name
        cell.restAdress?.text = cellRest.adress
        let imgName = cellRest.img + "_thumb"
        cell.restImg?.image = UIImage(named: imgName)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showRestDetail", sender: indexPath.row)
    }
    
        // MARK: ------  Navigation --------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "showRestDetail" {
            if let restPage = segue.destination as? RestaurantPage {
                if let indx = sender as? Int {
                    restPage.currRestaurant = restaurantArray[indx]
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
