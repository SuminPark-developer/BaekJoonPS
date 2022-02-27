#include <stdio.h>
#include <stdlib.h>

int main()
{

    int arr[7];

    for(int i = 0 ; i < 7; i++){
        scanf("%d", &arr[i]);
    }


    //getMax (C)
    int max = -99;
    for(int i = 0 ; i < 7; i++){
        if(arr[i] > max) max = arr[i];
    }

    //getMin (A)
    int min = 999999999;
    int minIdx = -1;
    for(int i = 0 ; i < 7; i++){
        if(arr[i] < min){
            min = arr[i];
            minIdx = i;
        } 
    }


    //getSecondMin (B)
    int min2 = 999999999;
    for(int i = 0 ; i < 7; i++){
        if(i == minIdx) continue;
        if(arr[i] < min2) min2 = arr[i];
    }

    printf("%d %d %d", min, min2, max-min-min2);

}