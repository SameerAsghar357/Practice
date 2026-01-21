#include <iostream>

using namespace std;

int main(){
    int n = 246;
    int rem, res = 0;

    cout << "Before Reverse: " << endl;
    cout << n << endl;

    while(n>0)
    {
        rem = n % 10;
        res = (res * 10) + rem;
        n = n / 10;
    }

    cout << "After Reverse:" << endl;
    cout << res;
    
return 0;
}