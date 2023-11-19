//
//  OffsetKey.swift
//  ToDoList
//
//  Created by Lê Văn Duy on 19/11/2023.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
    
    
}

