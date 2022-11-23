#include <stdio.h>
int isPrime(int a)
{
    if (a == 1)
    {
        return 1;
    }

    int tmp = 2;
    while (tmp < a)
    {
        if ((a % tmp) == 0)
        {
            return 0;
        }
        tmp++;
    }
    return 1;
}
int factoriala(int a)
{
    if (a <= 1)
    {
        return a;
    }
    return a * (factoriala(a - 1));
}
int isStrong(int b)
{
    int sum = 0;
    int n = b;
    while (n > 0)
    {
        int curr = n % 10;
        sum += factoriala(curr);
        n /= 10;
    }
    if (sum == b)
    {
        return 1;
    }
    return 0;
}