//
//  CustomToolbar.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/03/28.
//

import SwiftUI

struct CustomToolbar: View {
    @State var buttonMessage = "Nothing pressed"
    var body: some View {
//        NavigationView {
//            Text(buttonMessage).toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {buttonMessage="Leading button was pressed"}) {
//                        Text("Leading")
//                    }
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {buttonMessage="Tailing button was pressed"}) {
//                        Text("Tailing")
//                    }
//                }
//                ToolbarItemGroup(placement: .bottomBar) {
//                    Button(action: {buttonMessage="Button1 button was pressed"}) {
//                        Text("Bottom 1")
//                    }
//                    Button(action: {buttonMessage="Buttom2 button was pressed"}) {
//                        Text("Bottom 2")
//                    }
//                }
//            }
//        }
        NavigationView {
            List {
                Text("メモ１")
                Text("メモ２")
                Text("メモ３")
            }.navigationTitle("メモ").toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
//                    Refer "SFSymbols" to search systemName
                    Button(action: {}) {
                        Image(systemName: "ellipsis.circle")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {}) {
                        Image(systemName: "checklist")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "camera")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "pencil.tip.crop.circle")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

struct CustomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomToolbar()
    }
}
