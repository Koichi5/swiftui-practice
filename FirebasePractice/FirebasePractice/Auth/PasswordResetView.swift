//
//  PasswordResetView.swift
//  FirebasePractice
//
//  Created by Koichi Kishimoto on 2023/04/27.
//

import SwiftUI
import FirebaseAuth

struct PasswordResetView: View {
    @State var email: String = ""
    var body: some View {
        VStack {
            TextField("mail address", text: $email).padding().textFieldStyle(.roundedBorder)
            Button(action: {
                Auth.auth().sendPasswordReset(withEmail: email) {
                    error in
                }
            }) {
                Text("メール送信")
            }
        }
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}

