#include <iostream>
#include <algorithm>
using namespace std;

int main() {
  int int_result = min(10, 20);
  cout << "Minimum is: " << int_result << endl;

  char char_result = min('a', 'b');
  cout << "Minimum is: " << char_result;
  return 0;
}