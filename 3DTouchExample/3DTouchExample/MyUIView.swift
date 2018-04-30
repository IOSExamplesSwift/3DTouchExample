//
//  MyUIView.swift
//  3DTouchExample
//
//  Created by Douglas Alexander on 4/30/18.
//  Copyright © 2018 Douglas Alexander. All rights reserved.
//

import UIKit

class MyUIView: UIView {

    var size:CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        
        // define the width and height of the display
        let view_width = self.bounds.width
        let view_height = self.bounds.height
        
        // use core grtaphics to fill a rectangle starting at the bottom; height = size
        let context = UIGraphicsGetCurrentContext()
        let rectangle = CGRect(x: 0, y: view_height - size, width: view_width, height: size)
        
        context?.addRect(rectangle)
        context?.setFillColor(UIColor.red.cgColor)
        context?.fill(rectangle)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        size = 0
        self.setNeedsDisplay()
    }
    
    func handleTouch(_ touches:Set<UITouch>) {
        if let touch = touches.first {
            size = touch.force + 100
            self.setNeedsDisplay()
        }
    }
}
