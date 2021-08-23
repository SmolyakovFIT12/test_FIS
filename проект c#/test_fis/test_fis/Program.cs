using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace test_fis
{
    class Program
    {
        
        static void Main(string[] args)
        {
            SQLConnect connect = new SQLConnect();
            try
            {
                connect.connectOpen();// открываем соединение 
                var cmd = connect.getAngryReader();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())// читаем результат запроса
                    {
                        string name = (string)reader["name"];
                        Console.WriteLine("Самый злобный читатель: " + name);
                    }
                }
                connect.connectClose();
                
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e.Message);
            }
            
        }
    }
}
