//
//  review-detail.swift
//  ramen
//
//  Created by Stanley-Robins-Hwasin on 2021/1/5.
//

import UIKit
import MapKit
import SwiftUI

class reviewListController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var reviewlist = ["竹下のレビュー","匿名レビュー","匿名レビュー"]
    var temp_element = ""
    
    @IBOutlet var table: UITableView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var map: MKMapView!
    @IBOutlet var shopname: UILabel!
    var didSelectName = ""
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = reviewlist[indexPath.row]
        return cell
    }
    
    //segue to detail
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectName = reviewlist[indexPath.row]
        self.performSegue(withIdentifier: "toDetailSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextController = segue.destination as? reviewController
        nextController?.temp_author = self.didSelectName
    }

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //shopname label
        
        shopname.text = "一蘭　〇〇店"
        shopname.text = temp_element
        shopname.font = UIFont.systemFont(ofSize: 25)
        shopname.textAlignment = NSTextAlignment.center
        //image
        image.image = #imageLiteral(resourceName: "一蘭.jpeg")
        
        image.layer.cornerRadius = 20;
        image.layer.masksToBounds = true;
        
        //review table
        self.table.dataSource = self
        self.table.delegate = self
        self.table.estimatedRowHeight = 50
        self.table.rowHeight = 70
        
        //map
        map.userTrackingMode = .follow
        let latitude:CLLocationDegrees = 35.6809591

        //経度の指定
        let longtude:CLLocationDegrees = 139.7673068

        //地図の広さ：画面の端から端までの緯度の差 (これを大きくするとズームアウト)
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01

        //地図の広さを指定して広さ(span)を割り出す
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)

        //経度と緯度を指定して位置(location) を割り出す
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtude)

        //region:位置と広さを指定して地図を表示する。
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        //Annotations
        map.removeAnnotations(map.annotations)
        let annotation = MKPointAnnotation()
        let shoplatitude = 35.69
        let shoplongtude = 139.80
        annotation.coordinate = CLLocationCoordinate2DMake(shoplatitude, shoplongtude)
        map.addAnnotation(annotation)
        map.selectAnnotation(annotation, animated: true)
        map.showAnnotations(map.annotations, animated: true)
        
        
        
    }
}
