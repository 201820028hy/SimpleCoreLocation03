//
//  ViewController.swift
//  SimpleCoreLocation03
//
//  Created by dit03 on 2019. 11. 7..
//  Copyright © 2019년 201820028. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var pins = [MKPointAnnotation]()
    var locationManager = CLLocationManager()//위치트랙킹
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //CLLocationManagerDelegate 객체와 ViewController 간의 연결
        locationManager.delegate = self
        
        //중심점 설정
//        let center = CLLocationCoordinate2D(latitude: 35.165990, longitude: 129.072564)
        
        //범위 설정
//        let span = MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
//
//        //지도 보여주는 영역인 region설정
//        let region = MKCoordinateRegion(center: center, span: span)
//
//        //mapView에 설정
//        mapView.setRegion(region, animated: true)
        
        
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        //locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        mapView.showsUserLocation = true
        
        let pin01 = MKPointAnnotation() //35.164455, 129.064984
        pin01.coordinate.latitude = 35.164455
        pin01.coordinate.longitude = 129.064984
        pin01.title = "송상현광장"
        pin01.subtitle = "우리집앞"
        pins.append(pin01)
        
        let pin02 = MKPointAnnotation()
        pin02.coordinate.latitude = 35.165990
        pin02.coordinate.longitude = 129.072564
        pin02.title = "동의과학대학교"
        pin02.subtitle = "우리학교"
        pins.append(pin02)
        
        let pin03 = MKPointAnnotation()
        pin03.coordinate.latitude = 35.168360
        pin03.coordinate.longitude = 129.057157
        pin03.title = "부산시민공원"
        pin03.subtitle = "공기조아"
        pins.append(pin03)
        
        mapView.showAnnotations(pins, animated: true)
    }
    
    //CLLocationManagerDelegate 메소드
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        
        let userLocation = locations[0]
        
        //중심점 : 사용자 위치
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        //범위 설정
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        //지도 보여주는 영역인 region설정
        let region = MKCoordinateRegion(center: center, span: span)
        
        //mapView에 설정
        mapView.setRegion(region, animated: true)
    }


}

