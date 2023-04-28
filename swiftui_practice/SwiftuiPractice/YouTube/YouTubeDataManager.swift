//
//  YouTubeDataManager.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/04/26.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var books: [Book] = []
    @Published var book = Book(title: "", numberOfPages: 0, auther: "")
    let db = Firestore.firestore()
    var errorMessage = ""
    
    init() {
        fetchAllBooks()
    }
    
//    This method can be used when you want to fetch book by id but, func bellow is more effective
    
//    func fetchBooksById(documentId: String) {
//        let docRef = db.collection("books").document(documentId)
//
//        docRef.getDocument { document, error in
//            if let error = error as NSError? {
//                self.errorMessage = "Error getting document: \(error.localizedDescription)"
//            }
//            else {
//                if let document = document {
//                    do {
//                        self.book = try document.data(as: Book.self)
//                    }
//                    catch {
//                        print(error)
//                    }
//                }
//            }
//        }
    
    func fetchAllBooks() {
        let docRef = db.collection("books")
        
        docRef.getDocuments() {( querySnapshot, error ) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    func fetchBooksById(documentId: String) {
        let docRef = db.collection("books").document(documentId)
        
        docRef.getDocument(as: Book.self) { result in
            switch result {
            case .success(let book):
                self.book = book
                self.errorMessage = ""
            case .failure(let error):
                self.errorMessage = "Error decoding document: \(error.localizedDescription)"
            }
        }
    }
    
    func updateBook(book: Book) {
        if let id = book.id {
            let docRef = db.collection("books").document(id)
            do {
                try docRef.setData(from: book)
            }
            catch {
                print(error)
            }
        }
    }
    
    func addBook(book: Book) {
        let collectionRef = db.collection("books")
        do {
            let newDocReference = try collectionRef.addDocument(from: self.book)
            print("Book stored with new document reference: \(newDocReference)")
        }
        catch {
            print(error)
        }
    }
    
    
//        books.removeAll()
//        let db = Firestore.firestore()
//        let ref = db.collection("Books")
//        ref.getDocuments { snapshot, error in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
//
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//
//                    let id = data["id"] as? String ?? ""
//                    let title = data["title"] as? String ?? ""
//                    let numberOfPages = data["numberOfPages"] as? Int ?? 0
//                    let auther = data["auther"] as? String ?? ""
//
//                    let book = Book(
//                        id: id,
//                        title: title,
//                        numberOfPages: numberOfPages,
//                        auther: auther
//                    )
//                    self.books.append(book)
//                }
//            }
//        }
//    }
}
