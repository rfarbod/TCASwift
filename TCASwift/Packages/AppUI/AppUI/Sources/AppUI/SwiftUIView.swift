//
//  SwiftUIView.swift
//  
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import SwiftUI

struct SwiftUIView: StatefulView<JobReducer> {
    var body: some View {
        VStack {
            List {
                ForEach(store.cur)
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
