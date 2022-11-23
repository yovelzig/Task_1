#include <stdio.h>
int powx(int a, int b)
{
    int temp = 1;
    while (b > 0)
    {
        temp *= a;
        b--;
    }
    return temp;
}
int isArmstrongRec(int a, int b, int c)
{
    if (a < 1)
    {
        return c;
    }

    c += powx(a % 10, b);
    return isArmstrongRec(a / 10, b, c);
}
int length(int a)
{
    int count = 0;
    while (a > 0)
    {
        count++;
        a /= 10;
    }
    return count;
}

int isPalindromeRec(int a, int b)
{
    if (a < 1)
    {
        return b;
    }
    b = b * 10 + (a % 10);
    return isPalindromeRec(a / 10, b);
}
int isArmstrong(int a)
{
    int b = length(a);
    int c = isArmstrongRec(a, b, 0);
    if (c == a)
    {
        return 1;
    }
    return 0;
}

int isPalindrome(int a)
{
    int b = isPalindromeRec(a, 0);
    if (b == a)
        return 1;
    return 0;
}
