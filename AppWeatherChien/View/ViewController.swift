//
//  ViewController.swift
//  AppWeatherChien
//
//  Created by Admin on 5/18/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var lb_text: UILabel!
    @IBOutlet weak var lb_temp: UILabel!
    @IBOutlet weak var imgBackground: UIImageView!
    
    var weatherDays : [Forecastday] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlerr), name: Notification.Name.init("updateday"), object: nil)
        DataServices.shared.getDatAPIday()
        
    }
    @objc func handlerr() {
        
        guard let weather = DataServices.shared.weather else { return }
        if weather.name == "Hanoi" {
            lb_name.text = "Hà Nội"
        }
        
        lb_text.text = weather.text
        
        if weather.text == "Trời quang" {
            imgBackground.image = #imageLiteral(resourceName: "troiquang")
        }
        if weather.text == "Các cơn giông tố nổi lên gầ" {
            imgBackground.image = #imageLiteral(resourceName: "troigiongto")
        }
        if weather.text == "Mưa rào vừa hoặc nặng" {
            imgBackground.image = #imageLiteral(resourceName: "troimua")
        }
        
        lb_temp.text = String(Int(weather.temp_c) ) + "℃"
        
        weatherDays = weather.forecastdays
        print(weatherDays.count)
        tableView.reloadData()
        print(weather.name, weather.text, weather.temp_c)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherDays.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as!  TableViewCell
        
        let weatherday = weatherDays[indexPath.row]
        
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSince1970: weatherday.date_epoch)
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "vi-VN")
        
        cell.lb_thu.text = String(describing: dateFormatter.string(from: date))
        cell.imgIcon.download(from: weatherday.icon)
        cell.lb_nhietdo.text = String(weatherday.maxtemp_c)
        tableView.tableFooterView = UIView(frame: .zero)
        return cell
    }
    
}

