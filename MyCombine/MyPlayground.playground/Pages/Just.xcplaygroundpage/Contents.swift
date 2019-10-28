import Combine

_ = Just("combine").sink { value in
  print(value)
}
