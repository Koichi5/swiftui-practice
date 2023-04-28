//
//  CustomNaigationView.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/03/28.
//

import SwiftUI

struct CustomNaigationView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Red へ遷移") {
                    Color.red.navigationTitle("Red")
                }
                NavigationLink("Blue へ遷移") {
                    Color.blue.navigationTitle("Blue")
                }
                NavigationLink("Yellow へ遷移") {
                    Color.yellow.navigationTitle("Yellow")
                }
//                isDetailLink が true だと、iPad で開く際に遷移するのではなく、右側の大きな画面が遷移先として開く
                NavigationLink("DetailLink True", destination: Text("DetailLink True")).isDetailLink(true)
                NavigationLink("DetailLink False", destination: Text("DetailLink False")).isDetailLink(false)
            }
        }
    }
}

struct CustomNaigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNaigationView()
    }
}
