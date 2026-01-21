#include <iostream>
#include <algorithm>

using namespace std;

int gcd(int a, int b){
    int res = min(a, b);
    
    while (res > 1){
        if (a % res == 0 && b % res == 0)
        {
            break;
        }   
    res--;
    }
    return res;
}

int main(){
    int a = 24, b = 36;
    
    int result = gcd(a, b);

    cout << "GCD: " << result;

    
return 0;
}