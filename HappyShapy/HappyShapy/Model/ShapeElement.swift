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
    var position: CGPoint = CGPoint()
    var size: CGSize = CGSize()
    var rotation: Double = 0
    var cornerRadius: CGFloat = 10
    var corners: Int = 5
    
    var name: String = "unnamed"
    var visible: Bool = true
    
    init(kind: ShapeElementKind) {
        self.id = UUID()
        self.kind = kind
    }
    
    init(kind: ShapeElementKind, position: CGPoint, size: CGSize) {
        self.id = UUID()
        self.kind = kind
        self.position = position
        self.size = size
    }
}
