using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace test_fis
{
    public class SQLConnect
    {
        SqlConnection connect;
        public SQLConnect()
        {
            var sConnStr = new SqlConnectionStringBuilder()
            {
                DataSource = @"LAPTOP-1GAL0TI1\SQLEXPRESS",// имя сервера
                InitialCatalog = "test_fis",// название бд
                IntegratedSecurity = true
            }.ConnectionString;
            connect = new SqlConnection(sConnStr);
        }



        public SqlCommand getAngryReader()//получить имя злобного читателя
        {

            var sCommand = new SqlCommand()
            {
                Connection = connect,
                CommandText = @"SELECT top 1 name FROM student inner join Orders on student.id = Orders.id_student
group by name
order by count(Orders.id) desc"
//текст запроса в базе данных
            };

            return sCommand;
        }


        public void connectOpen()
        {
            connect.Open();
        }

        public void connectClose()
        {
            connect.Close();
        }


    }
}
