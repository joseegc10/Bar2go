//
//  MyProgressView.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 11/4/21.
//

import SwiftUI

struct MyProgressView: View {
    var body: some View {
        VStack {
            ProgressView(value: 0.25)
        }
        .progressViewStyle(DarkBlueShadowProgressViewStyle())
    }
}

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}
