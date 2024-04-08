int a = 3;
int b = 2;
int c = 4;
int d = 6;

int numerador = a * c;
int denominador = b * d;
int mcd = Mcd(numerador, denominador);

numerador = numerador / mcd;
denominador = denominador / mcd;

int Mcd(int a, int b)
{
    int A = a;
    int B = b;
    while (A != B)
    {
        if (A > B)
        {
            A = B;
            B = A;
        }
        B = B - A;
    }
    return A;
}

System.Console.WriteLine(numerador + " , " + denominador);