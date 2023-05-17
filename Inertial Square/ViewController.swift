//
//  ViewController.swift
//  Inertial Square
//
//  Created by Владимир on 16.05.2023.
//
import UIKit

class ViewController: UIViewController {
    
    var squareView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        view.layer.cornerRadius = 12
        view.layer.cornerCurve = .continuous
        return view
    }()
    
    var animator: UIDynamicAnimator!
    
    var collision: UICollisionBehavior!
    
    var gravity : UIGravityBehavior!
    
    var snap: UISnapBehavior!

    var dynamicItemBehavior: UIDynamicItemBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareView.center = self.view.center
        self.view.addSubview(squareView)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        
        let touch = touches.first
        snap = UISnapBehavior(item: squareView, snapTo: touch!.location(in: view))
        animator.addBehavior(snap)
    }
    
    override func viewWillLayoutSubviews() {
        
    }
}
