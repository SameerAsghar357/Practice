#include <iostream>

using namespace std;

int main(){
    int num = 153;
    int rem;

    while (num < 1){
        rem = num % 10;
        num = num / 10;
    }
return 0;
}