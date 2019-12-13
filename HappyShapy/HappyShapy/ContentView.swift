//
//  ContentView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        EditorView(viewModel: EditorViewModel())
            .environmentObject(ShapeComposition.debugComposition())
            .background(Color("Background"))
            .edgesIgnoringSafeArea(.all)
            .accentColor(Color("Action"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
