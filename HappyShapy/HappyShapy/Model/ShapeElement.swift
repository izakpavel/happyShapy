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
    case roundedRectangle
    case star
    case polygon
}


class ShapeElement : Identifiable{
    let id: UUID
    let kind: ShapeElementKind
    var position: CGPoint
    var size: CGSize
    var rotation: Double
    var mainParam: CGFloat // used for stuff like rounded corners
    
    init(kind: ShapeElementKind, position: CGPoint, size: CGSize) {
        self.id = UUID()
        self.kind = kind
        self.position = position
        self.size = size
        self.rotation = 0
        self.mainParam = 5
    }
    
    init(kind: ShapeElementKind) {
        self.id = UUID()
        self.kind = kind
        self.position = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 0.2, height: 0.2)
        self.rotation = 0
        self.mainParam = 5
    }
}
