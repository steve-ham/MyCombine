import Combine

// bind

class MyClass {
    var string = ""
    init() {
        _ = Just("hello")
        .assign(to: \.string, on: self)
    }
    
    func sayHello() {
        print("hsteve string \(string)")
    }
}

let myClass = MyClass()

myClass.sayHello()
