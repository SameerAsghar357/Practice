#include <iostream>

using namespace std;

int main(){
    int arr[] = {1, 7, 3, 4, 0};
    int size = sizeof(arr) / sizeof(arr[0]);
    int greatest;
    
    greatest = arr[0];

    for (int i = 0; i < size; i++)
    {
        if(arr[i] > greatest){
            greatest = arr[i];
        }
    }

    cout << "Largest = " << greatest << endl;

return 0;
}