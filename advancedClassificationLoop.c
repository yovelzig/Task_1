#include <stdio.h>
int isArmstrong(int a)
{
    int counter = 0;
    int n = a;
    while (n > 0)
    {
        n /= 10;
        counter++;
    }
    n = a;
    int sum = 0;
    while (n > 0)
    {
        int count2 = counter;
        int temp = n % 10;
        int tmp = 1;
        while (count2 > 0)
        {
            tmp *= temp;
            count2--;
        }
        sum += tmp;
        n /= 10;
    }
    if (sum == a)
    {
        return 1;
    }
    return 0;
}
int isPalindrome(int a)
{
    int temp = 0;
    int n = a;
    while (n > 0)
    {
        temp = (temp * 10) + (n % 10);
        n /= 10;
    }
    if (temp == a)
    {
        return 1;
    }
    return 0;
}

int main()
{
    return 0;
}