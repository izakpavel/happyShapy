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
    @State var needsRedraw: Bool = false
    
    
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
    
    func positionChangeFromDragOffset(offset: CGSize) -> CGSize{
        let xChange = offset.width/size.width
        let yChange = offset.height/size.height
        return CGSize(width: xChange, height: yChange)
    }
    
    var body: some View {
        ZStack {
            ForEach (self.viewModel.shapeComposition.elements) { element in
                ShapeElementView(element: element)
                    .frame(width: self.elementWidth(element), height: self.elementHeight(element))
                    .position(self.elementPosition(element))
                    .onTapGesture {
                        self.viewModel.activeElement = element
                        self.viewModel.originalElementPosition = element.position
                    }
                .opacity(self.needsRedraw ? 1.0 : 1.0)
                    // TODO decide if we will use degrees or radians .rotationEffect(Angle())
            }
            TransformerView(size: self.transformerSize())
                .position(self.transformerPosition())
                .opacity(self.viewModel.activeElement != nil ? 1 : 0)
                .simultaneousGesture( DragGesture(minimumDistance: 1, coordinateSpace: .local) // can be changed to simultaneous gesture to work with buttons
                    .onChanged { value in
                        let dragOffset = value.translation
                        let elementOffset = self.positionChangeFromDragOffset(offset: dragOffset)
                        self.viewModel.activeElement?.position = CGPoint(x: self.viewModel.originalElementPosition.x + elementOffset.width, y: self.viewModel.originalElementPosition.y + elementOffset.height)
                        self.needsRedraw.toggle()
                    }
                    .onEnded { value in
                        // compute nearest index
                    }
                )
        }
        .background(Color("Canvas"))
        .frame(width: size.width, height: size.height)
    }
}

