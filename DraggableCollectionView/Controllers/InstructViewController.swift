//
//  InstructViewController.swift
//  DraggableCollectionView
//
//  Created by Phil Wright on 4/7/25.
//

import UIKit

class InstructViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let v = TrustBoundaryView(frame: self.view.frame)
        view.addSubview(v)
    }
}

