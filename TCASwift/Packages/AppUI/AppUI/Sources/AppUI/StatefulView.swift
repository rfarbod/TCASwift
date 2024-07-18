//
//  File.swift
//  
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import Foundation
import ComposableArchitecture

public protocol StatefulView<R: Reducer>: View {
    var store: StoreOf<R: Reducer> : { get set }

    init(store: StoreOf<R: Reducer>)
}
