#include <iostream>

using namespace std;

int main(){
    int n = 654987;
    int rem, res = 0;

    while(n>0)
    {
        rem = n % 10;
        res = res + rem;
        n = n / 10;
    }
    cout << "rem: " << rem << endl;
    cout << "The sum of all digits in n is " << res << endl;
    
return 0;
}