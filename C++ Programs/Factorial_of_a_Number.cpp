#include <iostream>

using namespace std;

int main(){
    int n = 6;
    int factorial = 1;

    for (int i = 1; i <= n; i++)
    {
        factorial *= i; 
    }

    cout << "Factorial of " << n << " is " << factorial << endl;
    

return 0;
}