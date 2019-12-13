//
//  ShapeComposition.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import Foundation
import SwiftUI

class ShapeComposition: ObservableObject {
    @Published var elements: [ShapeElement] = []

    
    init(elements: [ShapeElement]) {
        self.elements = elements
    }
    
    static func debugComposition() -> ShapeComposition {
        let elements = [ShapeElement(kind: .ellipse, position: CGPoint(x: 0, y:0.3), size: CGSize(width: 0.1, height: 0.2)),
                        ShapeElement(kind: .rectangle, position: CGPoint(x: 0.5, y:0.4), size: CGSize(width: 0.2, height: 0.3))
        ]
        return ShapeComposition(elements: elements)
    }
}

