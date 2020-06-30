using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace DT3_Lab
{
    public class Database
    {
        public static string connectionString = @"Data Source=DESKTOP-HIEO3C8\sqlexpress;Initial Catalog=DT3_Lab;Integrated Security=True";
        private static string LoadSettingData(string sql)
        {
            DataTable table = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, connectionString);
            dataAdapter.Fill(table);
            string returnValue = string.Empty;

            if (table.Rows.Count > 0)
            {
                returnValue = table.Rows[0].Field<string>("setting_value");
            }
            return returnValue;
        }
        public static class Get
        {
            private static string AccessLevelSQL()
            {
                string sql = "SELECT * FROM settings where setting_name = 'AccessLevelSQL'";
                return LoadSettingData(sql);
            }
            private static string AccessLevelIDSQL()
            {
                string sql = "SELECT * FROM settings where setting_name = 'AccessLevelIDSQL'";
                return LoadSettingData(sql);
            }
            //CheckUser
            private static string CheckUserSQL()
            {
                string sql = "SELECT * FROM settings where setting_name = 'CheckUser'";
                return LoadSettingData(sql);
            }
            private static List<string> LoadAccessLevelData(string sql)
            {
                List<string> list = new List<string>();
                DataTable table = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, connectionString);
                dataAdapter.Fill(table);

                if (table.Rows.Count > 0)
                {
                    foreach (DataRow dataRow in table.Rows)
                    {
                        list.Add(dataRow["access_level"].ToString());
                    }
                }
                return list;
            }
            private static int AccessLevelID(string sql)
            {
                int returnValue = -1;
                DataTable table = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, connectionString);
                dataAdapter.Fill(table);

                if (table.Rows.Count > 0)
                {
                    returnValue = table.Rows[0].Field<int>("id");
                }
                return returnValue;
            }
            private static int CheckUser(string sql)
            {
                int returnValue = -1;
                DataTable table = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, connectionString);
                dataAdapter.Fill(table);

                if (table.Rows.Count > 0)
                {
                    returnValue = table.Rows[0].Field<int>("user_count");
                }
                return returnValue;
            }
            public static List<string> UserAccessLevels()
            {
                return LoadAccessLevelData(AccessLevelSQL());
            }
            public static int AccessLevelIDFromString(string access_level)
            {
                string sql = string.Format(AccessLevelIDSQL(), access_level);
                return AccessLevelID(sql);
            }
            public static int CheckUserCount(string username)
            {
                string sql = string.Format(CheckUserSQL(), username);
                return CheckUser(sql);
            }
        }


        public static class Insert
        {
            private static string InsertUserSQL()
            {
                string sql = "SELECT * FROM settings where setting_name = 'UserInsertSQL'";
                return LoadSettingData(sql);
            }

            public static int User(string user_name, string user_password, string access_level, string full_name)
            {
                int access_level_id = Database.Get.AccessLevelIDFromString(access_level);
                string sql = string.Format(Database.Insert.InsertUserSQL(), user_name, user_password, full_name, access_level_id);
                return Item(sql);
            }

            private static int Item(string sql)
            {
                SqlConnection connection = new SqlConnection(Database.connectionString);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, connection);
                try
                {
                    connection.Open();
                    dataAdapter.InsertCommand = new SqlCommand(sql, connection);
                    int numRowsAffected = dataAdapter.InsertCommand.ExecuteNonQuery();

                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                    }

                    connection.Dispose();
                    dataAdapter.Dispose();
                    return 0;
                }
                catch
                {
                    return -1;
                }
            }
        }
        public static class Delete
        {

        }
        public static class Update
        {

        }
    }
}