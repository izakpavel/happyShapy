//
//  EditorViewModel.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import Foundation
import SwiftUI

class EditorViewModel : ObservableObject{
    @Published var addDialogOpened: Bool = false
    @Published var shapeListExpanded: Bool = true
    @Published var listWidth: CGFloat = 300
    
    func toggleListExpansion() {
        if self.shapeListExpanded {
            self.shapeListExpanded = false
            self.listWidth = 100
        }
        else {
            self.shapeListExpanded = true
            self.listWidth = 300
        }
    }
}
