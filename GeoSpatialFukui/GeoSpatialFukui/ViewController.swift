//
//  ViewController.swift
//  GeoSpatialFukui
//
//  Created by 野村弘樹 on 2019/02/09.
//  Copyright © 2019 Hiroki Nomura. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    //CLLocationManagerの入れ物を用意
    var myLocationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CLLocationManagerをインスタンス化
        myLocationManager = CLLocationManager()
        
        //位置情報使用許可のリクエストを表示するメソッドの呼び出し
        myLocationManager.requestWhenInUseAuthorization()
        
        // ピンを複数立てる
        addAnnotation(35.6800494,139.7609786, "カフェ・ド・クリエ 丸の内MYPLAZA店", "東京都千代田区丸の内２丁目１−１")
        
    }
    
    //位置情報取得に失敗したときに呼び出されるメソッド
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
    func addAnnotation(_ latitude: CLLocationDegrees,_ longitude: CLLocationDegrees,_ title:String,_ subtitle:String) {
        
        // ピンの生成
        let annotation = MKPointAnnotation()
        
        // 緯度経度を指定
        annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        // タイトル、サブタイトルを設定
        annotation.title = title
        annotation.subtitle = subtitle
        
        // mapViewに追加
        mapView.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
