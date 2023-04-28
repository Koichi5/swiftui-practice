//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/03/03.
//

import SwiftUI
import FirebaseCore
//import Amplify

// 追加
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct SwiftUIPracticeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            YoutubeContentView()
        }
    }
    
    //    private func configureAmplify() {
    //        do{
    //            try Amplify.configure() {
    //                print("Successfully configured Amplify");
    //            } catch {
    //                print(e);
    //            }
    //        }
    //    }
}