using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppTimeElapsed  //laboratorio Arquitectura de Computadores
{
    class Program
    {
        public static void Main(string[] args)
        {

            try
            {
                StreamWriter sw = new StreamWriter(@"C:\Users\PC\Documents\MEGAsync\ICESI\Arquitectura de Hardware\lab-hardware-architecture\ConsoleAppTimeElapsed\Time_ij.txt"); //cambie el path

                int n = 4000;  //tamaño del arreglo
                int[,] matriz = new int[n, n];

                for (int i = 0; i < 100; i++)
                {
                    sw.WriteLine(sumaIntXparam(matriz,n));
                    //sw.WriteLine(sumaIntLocal());
                }
                sw.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }
        }

        public static double sumaIntXparam(int[,] matriz, int n)
        {

            int suma = 0;
            //int LengthM = matriz.GetLength(0);

            Stopwatch sw = new Stopwatch();
            sw.Restart();
            sw.Start();

            for (int j = 0; j < n; j++)
            {
                for (int i = 0; i < n; i++)
                {
                    suma += matriz[j, i];
                }
            }

            sw.Stop();

            long tiempo = (long)(sw.Elapsed.TotalMilliseconds * 1000000);

            return tiempo;
        }

        public static double sumaIntLocal()
        {
            int n = 3000;  //tamaño del arreglo

            int[,] matriz = new int[n, n];  //se define la variable matriz localmente
            //int LengthM = matriz.GetLength(0);
            int suma = 0;

            Stopwatch sw = new Stopwatch();
            sw.Restart();
            sw.Start();


            for (int j = 0; j < n; j++)
            {
                for (int i = 0; i < n; i++)
                {
                    suma += matriz[i, j];
                }
            }

            sw.Stop();

            long tiempo = (long)(sw.Elapsed.TotalMilliseconds * 1000000);

            return tiempo;
        }
    }
}
