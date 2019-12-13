//
//  EditorView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct ElementCellView: View {
    @ObservedObject var element: ShapeElement
    var textVisible: Bool
    var body: some View {
        
        HStack {
            MultiElementShape(element: element)
                .frame(width: 44, height: 44)
                .padding()
            if (self.textVisible) {
                Text(element.name)
                    .lineLimit(1)
            }
            Spacer()
            Button(action:{
                self.element.visible.toggle()
            }){
                Image(systemName: element.visible ? "eye.fill" : "eye.slash")
            }
        }
    }
}

struct ElementListView: View {
    @EnvironmentObject var viewModel: EditorViewModel
    var body: some View {
        List(viewModel.shapeComposition.elements) { element in
            HStack {
                MultiElementShape(element: element)
                    .frame(width: 44, height: 44)
                    .padding()
                if (self.viewModel.shapeListExpanded) {
                    Text(element.name)
                        .lineLimit(1)
                }
                Spacer()
                Button(action:{
                    element.visible.toggle()
                }){
                    Image(systemName: element.visible ? "eye.fill" : "eye.slash")
                }
            }
        }
    }
}


struct EditorView: View {
    @EnvironmentObject var viewModel: EditorViewModel
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Button (action:{
                        self.viewModel.openAddDialog()
                    }){
                        HStack {
                            Image(systemName: "plus")
                                .font(.title)
                                .padding()
                            if (viewModel.shapeListExpanded) {
                                Text("editor.add")
                                    .padding()
                            }
                        }
                    }
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("Action")))
                    .padding()
                    ElementListView()
                    HStack {
                        Spacer()
                        Button (action:{
                            withAnimation {
                                self.viewModel.toggleListExpansion()
                            }
                        }){
                            Image(systemName: self.viewModel.shapeListExpanded ? "chevron.left" : "chevron.right")
                                .padding()
                        }
                    }
                }
                .background(Color("Form"))
                .frame(width: self.viewModel.listWidth)
                
                GeometryReader { geometry in
                    ShapeCompositionView(size: geometry.size)
                }
            }
            .blur(radius: self.viewModel.addDialogOpened ? 20 : 0)
            if (self.viewModel.addDialogOpened) {
                AddShapeView()
                    .frame(width: 400, height: 400)
            }
        }
    }
}
