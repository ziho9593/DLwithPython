import UIKit

struct Person {
    // Stored Property
    var firstName: String {
//        willSet {
//            print("willSet: \(firstName) --> \(newValue)")
//        }
        
        didSet {
            print("didSet: \(oldValue) --> \(firstName)")
        }
    }
    var lastName: String
    
    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()
    
    // Computed Property
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    /*
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }

        set {
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }

            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    */
    
    func fullName2() -> String {
        return "\(firstName) \(lastName)"
    }
    
    // Type Property
    static let isAlien: Bool = false
}

var person = Person(firstName: "James", lastName: "Han")

person.firstName
person.lastName

person.firstName = "Jason"
person.lastName = "Lee"

person.firstName
person.lastName

person.fullName

//person.fullName = "Jay Park"
//person.firstName
//person.lastName

Person.isAlien

person.isPopular


// Computed Property vs. Method
person.fullName
person.fullName2()
