#include <iostream>

using namespace std;

int main(){
    int n = 10;
    int result = 0;
    
    for (int i = 1; i <= n; i++)
    {
        result += i;
    }
    
    cout << "The sum of first " << n << " natural numbers is " << result << endl;

    return 0;
}