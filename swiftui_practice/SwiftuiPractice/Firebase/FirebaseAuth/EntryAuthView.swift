//
//  EntryAuthView.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/03/31.
//

import SwiftUI
import FirebaseAuth

struct EntryAuthView: View {
    @State var name:String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var isRegisterSuccess: Bool = false
    var body: some View {
        NavigationView(content: {
            VStack {
                Text("name")
                TextField("name", text: $name).padding(.bottom).textFieldStyle(.roundedBorder)
                Text("email")
                TextField("email", text: $email).padding(.bottom).textFieldStyle(.roundedBorder)
                Text("password")
                SecureField("password", text: $password).padding(.bottom).textFieldStyle(.roundedBorder)
                Button(action: {
                    Auth.auth().createUser(withEmail: email, password: password) {
                        result, error in if let user = result?.user {
                            let request = user.createProfileChangeRequest()
                            request.displayName = name
                            request.commitChanges {
                                error in
                                    if error == nil {
                                        user.sendEmailVerification() {
                                            error in if error == nil {
                                                isRegisterSuccess = true
                                            }
                                        }
                                }
                            }
                        }
                    }
                }, label: {
                    Text("新規登録")
                }).padding().fullScreenCover(isPresented: $isRegisterSuccess) {
                    CustomMap()
                }
            }.navigationTitle(Text("新規登録"))
        })
    }
}

struct EntryAuthView_Previews: PreviewProvider {
    static var previews: some View {
        EntryAuthView()
    }
}
