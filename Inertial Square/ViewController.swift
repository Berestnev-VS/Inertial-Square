//
//  ViewController.swift
//  Inertial Square
//
//  Created by Владимир on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        squareView.center = self.view.center
        squareView.backgroundColor = UIColor.systemBlue
        squareView.layer.cornerRadius = 12
        squareView.layer.cornerCurve = .continuous
        self.view.addSubview(squareView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: self.view)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.squareView.center = touchPoint
            self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 4))
        }) { (finished) in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.squareView.transform = CGAffineTransform.identity
            })
        }
    }
}
