//
//  AddShapeView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct AddShapeView: View {
    @State var newElement: ShapeElement = ShapeElement(kind: .ellipse)
    @State var sliderVal = 0.2
    let elementsToChoose = AddShapeView.elementToChooseFrom()
    
    static func elementToChooseFrom()->[ShapeElement] {
        return ShapeElementKind.allKinds().map { ShapeElement(kind: $0, mainParam: 5)}
    }
    
    var body: some View {
        VStack {
            Text("editor.add")
                .font(.title)
                .padding()
            HStack {
                ForEach (self.elementsToChoose) { element in
                    MultiElementShape(element: element)
                        .fill(Color.secondary)
                        .frame(width: 44, height: 44)
                        .overlay(
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("Action").opacity(element.kind == self.newElement.kind ? 0 : 1))
                        )
                }
            }
            .padding()
            if (newElement.kind.containParam()) {
                Slider(value: self.$sliderVal, in: 0...1.0)
                .padding()
            }
            
            MultiElementShape(element: newElement)
                .fill(Color.secondary)
                .frame(width: 200, height: 200)
                .padding()
            
            HStack {
                Button(action: {
                    
                }) {
                    Text("button.discard")
                }
                
                Button(action: {
                    
                }) {
                    Text("button.confirm")
                }
            }
            .padding()
        }
        .background(Color("Form"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
