//
//  ShapeCompositionView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct ShapeCompositionView: View {
    @EnvironmentObject var viewModel: EditorViewModel
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
    
    func transformerSize() -> CGSize{
        if let activeElement = self.viewModel.activeElement {
            let width = self.elementWidth(activeElement)
            let height = self.elementHeight(activeElement)
            return CGSize(width: width, height:height)
        }
        return CGSize()
    }
    
    func transformerPosition() -> CGPoint{
        if let activeElement = self.viewModel.activeElement {
            return self.elementPosition(activeElement)
        }
        return CGPoint()
    }
    
    var body: some View {
        ZStack {
            ForEach (self.viewModel.shapeComposition.elements) { element in
                ShapeElementView(element: element)
                    .frame(width: self.elementWidth(element), height: self.elementHeight(element))
                    .position(self.elementPosition(element))
                    .onTapGesture {
                        self.viewModel.activeElement = element
                    }
                    // TODO decide if we will use degrees or radians .rotationEffect(Angle())
            }
            TransformerView(size: self.transformerSize())
                .position(self.transformerPosition())
                .opacity(self.viewModel.activeElement != nil ? 1 : 0)
        }
        .background(Color("Canvas"))
        .frame(width: size.width, height: size.height)
    }
}

