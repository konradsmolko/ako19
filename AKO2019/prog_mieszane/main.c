#include <stdio.h>

int szukaj4_max(int, int, int, int);
int szukajn_max(int n, int* array);

int main()
{
	int w, x, y, z, wynik, wynik2;
	int arr[] = { 1,2,-3,4,5,6,7,-345,132,1,52,6,-234,14,642,345,65,-1251,535,426,1234,1345,6,73,73,2,5213,41,-56,36 };

	//printf("\nProszę podać cztery liczby całkowite ze znakiem: ");
	//scanf_s("%d %d %d %d", &w, &x, &y, &z);
	//wynik = szukaj4_max(w, x, y, z);
	//printf("\nSpośród podanych liczb %d, %d, %d, %d liczba %d jest największa\n", w, x, y, z, wynik);

	wynik2 = szukajn_max(30, arr);
	printf("\nSpośród podanych liczb w tablicy liczba %d jest największa\n", wynik2);
	return 0;
}
