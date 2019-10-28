import Combine

Publishers.Sequence(sequence: [1, 2, 3])
    .sink { number in
        print("hsteve number \(number)")
}

