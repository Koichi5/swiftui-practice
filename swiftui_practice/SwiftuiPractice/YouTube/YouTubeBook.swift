//
//  YouTubeProduct.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/04/26.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Book: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var numberOfPages: Int
    var auther: String
}
