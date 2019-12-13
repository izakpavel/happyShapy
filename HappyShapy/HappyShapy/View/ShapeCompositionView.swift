//
//  ShapeCompositionView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct ShapeCompositionView: View {
    @EnvironmentObject var shapeComposition: ShapeComposition
    var size: CGSize
    
    func elementPosition(_ element: ShapeElement) -> CGPoint{
        return CGPoint(x: element.position.x*size.width, y: element.position.y*size.height)
    }
    
    func elementWidth(_ element: ShapeElement) -> CGFloat{
        return element.size.width*size.width
    }
    
    func elementHeight(_ element: ShapeElement) -> CGFloat{
        return element.size.height*size.height
    }
    
    var body: some View {
        ForEach (self.shapeComposition.elements) { element in
            ShapeElementView(element: element)
                .frame(width: self.elementWidth(element), height: self.elementHeight(element))
                .position(self.elementPosition(element))
                // TODO decide if we will use degrees or radians .rotationEffect(Angle())
        }
    }
}

