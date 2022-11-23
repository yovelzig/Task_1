#include <stdio.h>
#include "NumClass.h"
int printall(int a, int b)
{
   int c = b;
   int curr = 0;
   printf("\nPrime numbers : ");
   while (b <= a)
   {
      curr = isPrime(b);
      if (curr == 1)
      {
         printf("%d ,", b);
      }
      b++;
   }
   b = c;
   printf("\nArmstrong numbers : ");
   while (b <= a)
   {
      curr = isArmstrong(b);
      if (curr == 1)
      {
         printf("%d ,", b);
      }
      b++;
   }
   b = c;
   printf("\nStrong numbers : ");
   while (b <= a)
   {
      curr = isStrong(b);
      if (curr == 1)
      {
         printf("%d ,", b);
      }
      b++;
   }
   b = c;
   printf("\nPalindrome numbers : ");
   while (b <= a)
   {
      curr = isPalindrome(b);
      if (curr == 1)
      {
         printf("%d ,", b);
      }
      b++;
   }
   printf("\n");
   return 0;
}

int main()
{
   int x, y;
   printf("Enter the first number : \n");
   scanf("%d", &x);
   printf("Enter the second number : \n");
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