//
//  largeSegment.swift
//  interface
//
//  Created by Rahim Siahpoosh on 2018-01-09.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import UIKit

class largeSegment: UISegmentedControl {
    
    override func draw(_ rect: CGRect) {
        let segFrame = self.frame
        self.frame = CGRect(x: segFrame.origin.x,y: segFrame.origin.y, width: segFrame.size.width, height: 60)
    }
}
