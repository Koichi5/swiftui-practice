//
//  CustomView.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/03/28.
//

import SwiftUI

struct CustomView: View {
    let color: Color
    let text: String
    var body: some View {
        Text(text).background(color)
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView(color: Color.red, text: "hello")
    }
}
