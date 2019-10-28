import Combine

// PublishSubject

let subject = PassthroughSubject<String, Never>()
subject.sink { string in
    print("hsteve string \(string)")
}

subject.send("hello")
