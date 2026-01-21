// #include <iostream>

// using namespace std;

// int main(){
//     string str = "falg";
//     string temp_str = str;
//     int size = str.length();
//     char temp;
    
//     for (int i = 0; i < size/2; i++)
//     {
//         temp = str[i];
//         str[i] = str[size-i-1];
//         str[size-i-1] = temp;
//     }
    
//     // cout << "str: " << str << endl;
//     // cout << "temp_str: " << temp_str << endl;

//     if(str == temp_str){
//         cout << "Palindrome" << endl;
//     }
//     else{
//         cout << "Not Parlindrome" << endl;
//     }
        
    
// return 0;
// }

#include <iostream>

using namespace std;

int main(){
    int n = 12321;
    int temp = n;
    int rem, res = 0;

    // while (n>0)
    // {
    //     count++;
    //     n /= 10;
    // }

    while(n>0)
    {
        rem = n % 10;
        res = (res * 10) + rem;
        n = n / 10;
    }


    if(res == temp){
        cout << "Palindrome" << endl;
    }
    else{
        cout << "Not Palindrome" << endl;
    }
    


return 0;
}