//
//  CustomShape.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/03/28.
//

import SwiftUI

struct CustomShape: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).frame(width: 175, height: 100).foregroundColor(Color.white).background(Color.black).clipShape(Circle())
            Text("Hello, World!").frame(width: 175, height: 100).foregroundColor(Color.white).background(Color.black).clipShape(Capsule())
        }
    }
}

struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        CustomShape()
    }
}
