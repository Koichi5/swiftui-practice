//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/03/03.
//

import SwiftUI
import MapKit

struct ContentView: View {
//    @State var text = "Hello World!" ...1
//    @State var message = "Nothing"
//    let label: String = "This product's price is" ...3
//    let price: Int = 50 ...3
//    let double: Double = 70 ...2
//    let scoreList: [Int] = [80, 90, 95, 88, 91, 100]
//    @State var message: String = "Nothing is puressed"
    
    var body: some View {
        CustomMap()
//        learn: How to use custom widget in other file
//        CustomViewExample()
        
        //        learn: ignoreSafeArea uses to fill contents all screen.
//        Color.cyan.ignoresSafeArea()
        
//        learn: How to use HStack
//        HStack{
//            Text("Hello World")
//            Text("Are you ready?")
//        }
        
//        learn: How to use ZStack
//        ZStack{
//            Color.yellow
//            Text("Hello World")
//        }
        
//        learn: How to use VStack
//        VStack {
//            Text("Spacer practice 1")
//            Spacer()
//            Text("Spacer practice 2")
//            Spacer()
//                        Button(message){
//                            message = "Button 1 Pressed"
//                        };
//                        Button(
//                            message,
//                        action: {
//                            message = "Button 2 Pressed"
//                        }
//                        )
//                        Button(
//                            action: {
//                                message = "Button 3 Pressed"
//                            },
//                            label: {
//                                Text(message)
//                            }
//                        )
                
//            for score in scoreList {
//                if score > 90 {
//                    Text(String(score))
//                } else {
//                    Text("Your score is \(score). Not but...")
//                }
//            }
//            Text(label + String(price)) ...3
        
//        learn: How to use text modifier
//            Text("こんにちは")
//                .font(.title)
//                .frame(maxWidth:.infinity)
//                .frame(height: 100)
//                .background(Color.red)
//                .foregroundColor(Color.white) ...1
//            Text("\(double)") ...2
//        }
        
//        learn: How to use Image
//        Image("red_gradation_apple").resizable().aspectRatio(contentMode: .fit)
//        VStack{
//            Text("りんご").padding(.bottom)
//            Text("みかん")
//            Text("バナナ")
//        }
//        VStack {
//            Image("red_gradation_apple")
//            Text(text)
//                .padding()
//            Spacer()
//            Button("ボタン") {
//                text = "こんばんわ"
//            };
//            Text(message)
//            Button("button 1"){
//                message = "Button 1 Pressed"
//            };
//            Button(
//                "button 2",
//            action: {
//                message = "Button 2 Pressed"
//            }
//            )
//            Button(
//                action: {
//                    message = "Button 3 Pressed"
//                },
//                label: {
//                    Text("button 3")
//                }
//            )
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
