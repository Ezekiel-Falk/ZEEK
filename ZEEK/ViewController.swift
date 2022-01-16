//
//  ViewController.swift
//  ZEEK
//
//  Created by Ezekiel Faulknor on 12/11/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var KartView0: UIImageView!
    
    @IBOutlet weak var KartView1: UIImageView!
    
    var startingPointKartView0 = CGPoint()
    var startingPointKartView1 = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startingPointKartView0 =
            KartView0.center
        startingPointKartView1 =
            KartView1.center
    }
    
    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        
        print("Location: x: \(location.x), y: \(location.y)")
        
        let cartlocation = sender.view!
        
        cartlocation.center = location
        
    }
    
    
    @IBAction func didPinchKartView(_ sender: UIPinchGestureRecognizer) {
        
        let scale = sender.scale
        
        print("scale: \(scale)")
        
        let kartView = sender.view!
        
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        
        let rotation = sender.rotation
        
        print("rotation: \(rotation)")
        
        let kartView = sender.view!
        
        kartView.transform = CGAffineTransform(rotationAngle: rotation)

    }
    
    
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        
        print("Double tap recognized")
        
        let kartView = sender.view!
        
        UIView.animate(withDuration: 0.6) {
           // Closure body
           kartView.center.x += 400
        }

    }
    
    
    @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
        print("hold")
        UIView.animate(withDuration: 0.8) {
            
              self.KartView0.center = self.startingPointKartView0
              self.KartView0.transform = CGAffineTransform.identity
              self.KartView1.center = self.startingPointKartView1
              self.KartView1.transform = CGAffineTransform.identity
        }

    }
    
}
