//
//  SwiftUIView.swift
//  
//
//  Created by Farbod Rahiminik on 7/20/24.
//

import SwiftUI

public struct HeliButton: View {
    let action: () -> Void
    let backgroundColor: Color
    let text: String

    public init(action: @escaping () -> Void, backgroundColor: Color, text: String) {
        self.action = action
        self.backgroundColor = backgroundColor
        self.text = text
    }

    public var body: some View {
        Button(
            action: action,
            label: {
                Text(text)
                    .font(.system(size: 15, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        )
        .background(backgroundColor)
        .cornerRadius(15)
        .padding(10)
    }
}
