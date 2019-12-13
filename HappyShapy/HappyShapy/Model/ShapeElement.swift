//
//  ShapeElement.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import Foundation
import SwiftUI

enum ShapeElementKind : Int{
    case ellipse = 0
    case rectangle = 1
    case roundedRectangle = 2
    case star = 3
    case polygon = 4
    
    func containParam()->Bool {
        return (self != .ellipse && self != .rectangle)
    }
    
    static func allKinds() -> [ShapeElementKind]{
        return [.ellipse, .rectangle, .roundedRectangle, .star, .polygon]
    }
}


class ShapeElement : Identifiable{
    let id: UUID
    let kind: ShapeElementKind
    var position: CGPoint
    var size: CGSize
    var rotation: Double
    var mainParam: CGFloat // used for stuff like rounded corners
    
    var name: String
    var visible: Bool
    
    init(kind: ShapeElementKind, mainParam: CGFloat) {
        self.id = UUID()
        self.kind = kind
        self.position = CGPoint()
        self.size = CGSize()
        self.rotation = 0
        self.mainParam = mainParam
        self.name = ""
        self.visible = true
    }
    
    init(kind: ShapeElementKind, position: CGPoint, size: CGSize) {
        self.id = UUID()
        self.kind = kind
        self.position = position
        self.size = size
        self.rotation = 0
        self.mainParam = 5
        self.name = ""
        self.visible = true
    }
    
    init(kind: ShapeElementKind) {
        self.id = UUID()
        self.kind = kind
        self.position = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: 0.2, height: 0.2)
        self.rotation = 0
        self.mainParam = 5
        self.name = ""
        self.visible = true
    }
}
