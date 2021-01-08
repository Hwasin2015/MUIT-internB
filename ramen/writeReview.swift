//
//  writeReview.swift
//  ramen
//
//  Created by Stanley-Robins-Hwasin on 2021/1/5.
//

import UIKit
import MapKit
import SwiftUI

class writeReviewController: UIViewController{

    @IBOutlet weak var shopname: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var reviewBox: UITextField!
    @IBOutlet weak var ruleBox: UITextField!
    @IBAction func submit(_ sender: Any) {
        let alert = UIAlertController(title: "ありがとう", message: "投稿完了しました", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "戻る", style: UIAlertAction.Style.default, handler: { _ in self.performSegue(withIdentifier: "backToShopList", sender: self)}))

        //self.performSegue(withIdentifier: "backToShopList", sender: self)

        self.present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextController = segue.destination as? reviewListController
        nextController?.temp_element = self.shopname.text!
    }

    
    


    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //shopname label
        shopname.text = "一蘭　〇〇店"
        shopname.font = UIFont.systemFont(ofSize: 25)
        shopname.textAlignment = NSTextAlignment.center
        //image
        image.image = #imageLiteral(resourceName: "一蘭.jpeg")
        
        image.layer.cornerRadius = 20;
        image.layer.masksToBounds = true;

        
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
        
        reviewBox.keyboardType = .default
        ruleBox.keyboardType = .default
        
        
    }
}
