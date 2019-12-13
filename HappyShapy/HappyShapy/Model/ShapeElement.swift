//
//  ShapeElement.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import Foundation
import SwiftUI

enum ShapeElementKind {
    case ellipse
    case rectangle
    case star
    case polygon
}


class ShapeElement {
    let kind: ShapeElementKind
    var position: CGPoint
    var size: CGSize
    var rotation: Double
    
    init(kind: ShapeElementKind, position: CGPoint, size: CGSize) {
        self.kind = kind
        self.position = position
        self.size = size
        self.rotation = 0
    }
    
    init(kind: ShapeElementKind) {
        self.kind = kind
        self.position = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 0.2, height: 0.2)
        self.rotation = 0
    }
}
