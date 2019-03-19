// Example for std::par
// make dir=parallel std=c++17
#include <algorithm> // for_each, execution::par
#include <chrono>    // chrono::steady_clock::now
#include <iostream>
#include <iterator> // ostream_iterator
#include <numeric>  // iota
#include <vector>   // vector

int main() {
  int size = 10;
  std::vector<float> vec;

  // initialize like numpy.arange
  std::iota(vec.begin(), vec.end(), 1.0);

  // FIXME: print vector
  // https://stackoverflow.com/questions/10750057/how-to-print-out-the-contents-of-a-vector
  for (float i : vec) // range-based for-loop
    std::cout << i << " ";

  // using copy and iterator
  std::copy(vec.begin(), vec.end(),
            std::ostream_iterator<float>(std::cout, " "));

  return 0;
}
