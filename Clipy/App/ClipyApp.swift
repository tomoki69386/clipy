//
//  ClipyApp.swift
//  Clipy
//
//  Created by 築山朋紀 on 2020/11/15.
//

import SwiftUI
import ComposableArchitecture

@main
struct ClipyApp: App {
    var body: some Scene {
        WindowGroup {
            HistoryListView(
                store: .init(
                    initialState: HistoryListState(),
                    reducer: historyListReducer,
                    environment: HistoryListEnvironment()
                )
            )
        }
    }
}
