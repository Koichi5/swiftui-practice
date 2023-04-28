import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class ProfileViewController: UIViewController {
    @IBOutlet private weak var favoriteMealSegment: UISegmentedControl!
    @IBOutlet private weak var favoriteSportsSsegment: UISegmentedControl!
    @IBOutlet private weak var yourPetsSegment: UISegmentedControl!
    @IBOutlet private weak var breakfaseEverydaySwitch: UISwitch!
    @IBAction private func didTapRegisterButton() {
        guard let user = Auth.auth().currentUser else {
            return
        }
        
        let favoriteMeal = FavoriteMeal.items[favoriteMealSegment.selectedSegmentIndex].rawValue
        let favoriteSports = FavoriteSports.items[favoriteSportsSsegment.selectedSegmentIndex].rawValue
        let yourPet = YourPet.items[yourPetsSegment.selectedSegmentIndex].rawValue
        let breakfastEverday = breakfaseEverydaySwitch.isOn
        
        let db = Firestore.firestore()
        
        db.collection("users").document(user.uid).setData([
            "favoriteMeal": favoriteMeal,
            "favoriteSports": favoriteSports,
            "yourPet": yourPet,
            "breakfastEverday": breakfastEverday,
        ]) { error in
            if let error = error {
                print(error)
                return
            }
            print("register succeeded")
        }
    }
}
