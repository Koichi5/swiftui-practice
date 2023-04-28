//
//  YoutubeContentView.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/04/21.
//

import SwiftUI
import Firebase

struct YoutubeContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isUserAlreadyLoggedIn = false
    
    var body: some View {
        if isUserAlreadyLoggedIn {
            YouTubeListView()
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button(action: {
                    signUp()
                }) {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .foregroundColor(.white)
                        .background(
                        RoundedRectangle(
                            cornerRadius: 10, style: .continuous)
                        .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        )
                }
                .padding(.top)
                .offset(y: 100)
                
                Button(action: {
                    login()
                }) {
                    Text("Already have an accound")
                        .bold()
                        .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                }
                .padding(.top)
                .offset(y: 110)
            }
            .frame(width: 350)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        isUserAlreadyLoggedIn = true
                    }
                }
            }
        }

        //            VStack(alignment: .leading, spacing: 20.0){
        //                Image("niagarafall").resizable().cornerRadius(10).aspectRatio( contentMode: .fit)
        //                HStack {
        //                    Text("Niagara Falls")
        //                        .font(.title)
        //                        .fontWeight(.semibold)
        //                    Spacer()
        //                    VStack {
        //                        HStack {
        //                            Image(systemName: "star.fill")
        //                            Image(systemName: "star.fill")
        //                            Image(systemName: "star.fill")
        //                            Image(systemName: "star.fill")
        //                            Image(systemName: "star.leadinghalf.filled")
        //                        }
        //                        .foregroundColor(.orange)
        //                        .font(.footnote)
        //                        Text("( Reviews 351 )")
        //                            .font(.footnote)
        //                    }
        //                    Spacer()
        //                }
        //                Text("Come visit the falls for an experience of a lifetime.")
        //                HStack{
        //                    Spacer()
        //                    Image(systemName: "fork.knife").foregroundColor(.gray)
        //                    Image(systemName: "figure.walk").foregroundColor(.gray)
        //                }
        //            }.padding()
        //            .background(Rectangle().foregroundColor(.white)
        //                .cornerRadius(20))
        //            .shadow(radius: 15)
        //            .padding()
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("user_email: \(String(describing: result!.user.email))")
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("user_email: \(String(describing: result!.user.email))")
            }
        }
    }
}

struct YoutubeContentView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeContentView()
    }
}

extension View {
    func placeholder<Content: View> (
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
        }
    }
}
