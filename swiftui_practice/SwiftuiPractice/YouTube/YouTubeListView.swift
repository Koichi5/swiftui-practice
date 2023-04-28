//
//  YouTubeListView.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/04/26.
//

import SwiftUI

struct YouTubeListView: View {
    @EnvironmentObject var dataManager: DataManager
    var body: some View {
        NavigationView {
            List(dataManager.books, id: \.id) { book in
                Text(book.title)
            }
            .navigationTitle("Books")
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "plus")
            })
        }
    }
}

struct YouTubeListView_Previews: PreviewProvider {
    static var previews: some View {
        YouTubeListView()
    }
}
