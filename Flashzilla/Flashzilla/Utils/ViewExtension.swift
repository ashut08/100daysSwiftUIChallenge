//
//  ViewExtension.swift
//  Flashzilla
//
//  Created by mac on 20/01/25.
//
import SwiftUI
extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}
