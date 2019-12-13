//
//  TransformerView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct TransformerView: View {
    var size: CGSize
    let dotSize:CGFloat = 12.0
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color("Action"), lineWidth: 2)
            
            Circle()
                .fill(Color("Action"))
                .frame(width: dotSize, height: dotSize)
                .position(x: 0, y: 0)
            Circle()
                .fill(Color("Action"))
                .frame(width: dotSize, height: dotSize)
                .position(x: size.width, y: 0)
            Circle()
                .fill(Color("Action"))
                .frame(width: dotSize, height: dotSize)
                .position(x: size.width, y: size.height)
            Circle()
                .fill(Color("Action"))
                .frame(width: dotSize, height: dotSize)
                .position(x: 0, y: size.height)
        }
        .frame(width: size.width, height: size.height)
    }
}
