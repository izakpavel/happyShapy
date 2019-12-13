//
//  ShapeElementView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct PolygonShape: Shape {
    var corners: Int
    
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let midX = Double(rect.width/2)
            let midY = Double(rect.height/2)
            
            guard corners>0 else {
                return
            }
            
            path.move(to: CGPoint(x: Double(rect.width), y: midY))
            
            for i in 0..<self.corners {
                let angle = Double.pi*2/Double(corners)*Double(i)
                let point = CGPoint(x: midX + midX*cos(angle), y: midY+midY*sin(angle))
                path.addLine(to: point)
            }
        }
    }
}

struct StarShape: Shape {
    var corners: Int
    let innerRadius: Double = 0.66
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let midX = Double(rect.width/2)
            let midY = Double(rect.height/2)
            
            guard corners>0 else {
                return
            }
            
            path.move(to: CGPoint(x: Double(rect.width), y: midY))
            
            for i in 0..<self.corners {
                var angle = Double.pi*2/Double(corners)*Double(i)
                let outerCorner = CGPoint(x: midX + midX*cos(angle), y: midY+midY*sin(angle))
                path.addLine(to: outerCorner)
                
                angle = Double.pi*2/Double(corners)*(Double(i)+0.5)
                let innerCorner = CGPoint(x: midX + midX*cos(angle)*innerRadius, y: midY+midY*sin(angle)*innerRadius)
                path.addLine(to: innerCorner)
            }
        }
    }
}

struct MultiElementShape: Shape {
    var shapeKind: ShapeElementKind
    var mainParam: CGFloat
    
    init(element: ShapeElement) {
        self.shapeKind = element.kind
        self.mainParam = element.mainParam
    }
    
    func path(in rect: CGRect) -> Path {
        switch shapeKind {
        case .ellipse:
            return Ellipse().path(in: rect)
        case .rectangle:
            return Rectangle().path(in: rect)
        case .roundedRectangle:
            let cornerRadius = rect.size.width*mainParam
            return RoundedRectangle(cornerRadius: cornerRadius).path(in: rect)
        case .polygon:
            return PolygonShape(corners: Int(mainParam)).path(in: rect)
        case .star:
            return StarShape(corners: Int(mainParam)).path(in: rect)
        }
    }
}

struct ShapeElementView: View {
    var element: ShapeElement
    var body: some View {
        MultiElementShape(element: element)
        // TODO style
    }
}
