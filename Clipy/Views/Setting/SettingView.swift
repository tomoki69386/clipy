//
//  SettingView.swift
//  Clipy
//
//  Created by 築山朋紀 on 2020/11/16.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            HStack {
                Text("アプリバージョン")
                Text("2020.11.16")
            }
        }
        .background(Color(.systemBackground))
        .navigationTitle("設定")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
