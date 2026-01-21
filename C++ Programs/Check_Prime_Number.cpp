#include <iostream>

using namespace std;

int main(){
    int n = 48;
    int prime = 1;

    for (int i = 2; i < n; i++)
    {
        if(n%i==0){
            prime = 0;
        }
    }

    if(prime==1){
        cout << "Prime" << endl;
    }
    else{
        cout << "Not Prime" << endl;
    }
    
return 0;
}