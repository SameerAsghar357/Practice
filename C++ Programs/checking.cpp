#include <iostream>

using namespace std;

int main(){
    int n = 1234565;
    int count = 0;

    while(n>0){
        count++;
        n = n / 10;
    }

    cout << "Total digits = " << count << endl;
return 0;
}