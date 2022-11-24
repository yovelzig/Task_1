#include <stdio.h>
#include "NumClass.h"
int printall(int a, int b)
{
   int c = b;
   int curr = 0;
   printf("The Armstrong numbers are: ");
   while (b <= a)
   {
      curr = isArmstrong(b);
      if (curr == 1)
      {
         printf("%d ", b);
      }
      b++;
   }
   b = c;
   printf("\nThe Palindromes numbers are: ");
   while (b <= a)
   {
      curr = isPalindrome(b);
      if (curr == 1)
      {
         printf("%d ", b);
      }
      b++;
   }
   b = c;
   printf("\nThe Prime numbers are: ");
   while (b <= a)
   {
      curr = isPrime(b);
      if (curr == 1)
      {
         printf("%d ", b);
      }
      b++;
   }
   b = c;
   printf("\nThe Strong numbers are: ");
   while (b <= a)
   {
      curr = isStrong(b);
      if (curr == 1)
      {
         printf("%d ", b);
      }
      b++;
   }
   printf("\n");
   return 0;
}

int main()
{
   int x, y;
   scanf("%d", &x);
   scanf("%d", &y);
   if (y < x)
   {
      printall(x, y);
   }
   else
   {
      printall(y, x);
   }
   
   return 0;
}