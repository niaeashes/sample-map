//
//  ExplorePanelViewController.swift
//  SampleMap
//
//  Created by Shota on 2019/03/28.
//  Copyright © 2019 NiaEashes. All rights reserved.
//

import UIKit
import MapKit

class ExplorePanelViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var panelViewController: UIViewController?
    var panelView: PanelView = PanelView()
    
    override func loadView() {
        super.loadView()
        loadExplorePanelViews()
    }
}

extension ExplorePanelViewController {
    
    var contentFrame: CGRect {
        return CGRect(
            x: panelView.frame.origin.x,
            y: panelView.frame.origin.y + panelView.roofHeight,
            width: panelView.frame.width,
            height: panelView.frame.height - panelView.roofHeight
        )
    }
    
    fileprivate func loadExplorePanelViews() {
        view.addSubview(panelView)
        panelView.frame = CGRect(
            x: view.frame.origin.x,
            y: view.frame.origin.y + view.frame.height / 2,
            width: view.frame.width,
            height: view.frame.height / 2
        )
        
        let panelViewController = PanelViewController()
        addChild(panelViewController)
        panelViewController.view.frame = contentFrame
        panelView.addSubview(panelViewController.view)
        panelViewController.didMove(toParent: self)
    }
}

class PanelView: UIView {
    
    var roofHeight: CGFloat = 16
    
    private let roofLayer = CALayer()
    private let handlerLayer = CALayer()
    private let backgroundLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        roofLayer.backgroundColor = UIColor.white.cgColor
        roofLayer.frame = CGRect(
            origin: .zero,
            size: CGSize(width: UIScreen.main.bounds.width, height: roofHeight * 2)
        )
        roofLayer.cornerRadius = 12
        
        handlerLayer.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        handlerLayer.frame = CGRect(
            origin: CGPoint(x: UIScreen.main.bounds.width / 2 - 60, y: 4),
            size: CGSize(width: 120, height: 6)
        )
        handlerLayer.cornerRadius = 3
        
        backgroundLayer.backgroundColor = UIColor.white.cgColor
        
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(roofLayer)
        layer.addSublayer(handlerLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundLayer.frame = CGRect(origin: CGPoint(x: 0, y: roofHeight), size: frame.size)
    }
}

class PanelViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        //view.backgroundColor = UIColor.white
    }
}
