import Combine

// BehaviorSubject

let subject = CurrentValueSubject<String, Never>("string1")
subject.sink { string in
    print("hsteve string \(string)")
}

subject.send("hello")

print("hsteve subject.value \(subject.value)")
