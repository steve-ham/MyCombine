import Combine

["A", "B", "C", "D", "E"]
    .publisher
    .collect()
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })

["A", "B", "C", "D", "E"]
.publisher
.collect(2)
.sink(receiveCompletion: { print($0) },
      receiveValue: { print($0) })
