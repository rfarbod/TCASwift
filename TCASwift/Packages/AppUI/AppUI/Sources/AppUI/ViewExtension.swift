//
//  File.swift
//  
//
//  Created by Farbod Rahiminik on 7/20/24.
//

import Foundation
import SwiftUI

extension View {
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
