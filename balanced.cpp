#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

bool balanced(vector<int>& weight, int j, int start){
    int greater = 0;
    int less = 0;
    for(int x = 0; x < start; x++){
        less += weight[x];
    }
    while( start < weight.size() && weight[start] == j ) {
         start++;
    }
    for(int x = start; x < weight.size(); x++){
        greater += weight[x];
    }
    return greater == less;
}


int main(){
    int n;
    cin >> n;
    std::vector<int> weights(n);
    for(int& i: weights){
        cin >> i;
    }
    sort(weights.begin(),weights.end());
    int start = 0;
    for(int i = 0;true; i++){
        while (weights[start] < i) {
            start++;
        }
        if (balanced (weights,i,start) ) {
            cout << i << "\n";
            return 0;
        }
    }
    
    return 0;
}
