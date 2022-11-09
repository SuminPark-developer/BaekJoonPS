#include<stdio.h>
#include<algorithm>
#include<math.h>
#include<string.h>

int s;

void binary(int n, int i)
{
	if (i == 0 && n <= 3)
	{
		s = 1;
		if (n == 1) s = 0;
	}

	else s = 2;

		for (int i = s; i >= 0; i--)
		{
			if (n >= pow(2, i))
			{
				printf("1");
				n -= int(pow(2, i));
			}
			else printf("0");
		}
	


}

int main(void)
{
	char input[333444];
	scanf("%s", &input);
	int len = strlen(input);

	if (input[0] == 48) printf("0");
	else
	{
		for (int i = 0; i < len; i++)
		{
			binary(input[i] - 48, i);
		}
	}
	
}