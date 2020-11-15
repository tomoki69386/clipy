//
//  ClipBoard.swift
//  Clipy
//
//  Created by 築山朋紀 on 2020/11/15.
//

import Foundation
import UIKit.UIImage

protocol Translatorable {
    static func translator(_ items: [[String: Any]]) -> [Self]
}

struct ClipBoard: Equatable, Translatorable, Identifiable {
    static func == (lhs: ClipBoard, rhs: ClipBoard) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: String
    let type: ClipBoardType
    
    enum ClipBoardType {
        case text(String)
        case image(UIImage)
        case url(URL)
    }
    
    static func translator(_ items: [[String : Any]]) -> [ClipBoard] {
        var clips: [ClipBoard] = []
        items.forEach({
            $0.filter { $0.key == "public.url" }
                .compactMap { $0.value as? URL }
                .forEach { url in
                    clips.append(.init(id: url.absoluteString, type: .url(url)))
                }
            
            $0.filter { $0.key == "public.png" }
                .compactMap { $0.value as? UIImage }
                .forEach { image in
                    clips.append(.init(id: image.debugDescription, type: .image(image)))
                }
            
            $0.filter { $0.key == "public.utf8-plain-text" }
                .compactMap { $0.value as? String }
                .forEach { text in
                    clips.append(.init(id: text, type: .text(text)))
                }
        })
        return clips
    }
}
