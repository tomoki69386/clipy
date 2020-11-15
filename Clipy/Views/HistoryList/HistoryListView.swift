//
//  HistoryListView.swift
//  Clipy
//
//  Created by 築山朋紀 on 2020/11/15.
//

import UIKit
import SwiftUI
import ComposableArchitecture

struct HistoryListState: Equatable {
    var clips: [ClipBoard] = []
}

enum HistoryListAction: Equatable {
    case onAppear
}

struct HistoryListEnvironment { }

let historyListReducer = Reducer<HistoryListState, HistoryListAction, HistoryListEnvironment> { state, action, _ in
    switch action {
    case .onAppear:
        let items = UIPasteboard.general.items
        state.clips = ClipBoard.translator(items)
        return .none
    }
}

struct HistoryListView: View {
    let store: Store<HistoryListState, HistoryListAction>
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                ScrollView {
                    VStack {
                        ForEach(viewStore.clips) { value in
                            ClipBoardView(value: value)
                        }
                    }
                }
                .onAppear(perform: {
                    viewStore.send(.onAppear)
                })
                .navigationTitle("履歴")
            }
        }
    }
}

struct ClipBoardView: View {
    let value: ClipBoard
    var body: some View {
        switch value.type {
        case let .text(text):
            Text(text)
        case let .image(image):
            Image(uiImage: image)
                .resizable()
                .clipped()
                .scaledToFill()
        case let .url(url):
            Text(url.absoluteString)
        }
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView(
            store: .init(
                initialState: HistoryListState(),
                reducer: historyListReducer,
                environment: HistoryListEnvironment()
            )
        )
    }
}
