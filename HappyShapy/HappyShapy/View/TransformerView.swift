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
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color("Action"), lineWidth: 1)
            
            Circle()
                .fill(Color("Action"))
                .frame(width: 10, height: 10)
                .position(x: 0, y: 0)
            Circle()
                .fill(Color("Action"))
                .frame(width: 10, height: 10)
                .position(x: size.width, y: 0)
            Circle()
                .fill(Color("Action"))
                .frame(width: 10, height: 10)
                .position(x: size.width, y: size.height)
            Circle()
                .fill(Color("Action"))
                .frame(width: 10, height: 10)
                .position(x: 0, y: size.height)
        }
        .frame(width: size.width, height: size.height)
    }
}
