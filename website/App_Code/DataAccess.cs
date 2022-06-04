using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DataAccess
/// </summary>
public static class DataAccess
{
	static DataAccess()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static bool DuplicateValue(string columnName, string tableName, string Value)
    {
        bool check = false;
        string value = string.Empty;
        string CheckValue = string.Empty;
        String strConnString = DB_Configuration.DbConnectionString;
        SqlCommand cmd = null;
        SqlConnection con = new SqlConnection(strConnString);
        string Querry = string.Empty;
        Querry = "SELECT" + " " + columnName + " " + "FROM" + " " + tableName + " " + "WHERE" + " " + columnName + " " + "='" + Value + "'";
        cmd = new SqlCommand(Querry);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        con.Open();
        try
        {
            value = cmd.ExecuteScalar().ToString();
        }
        catch
        {
            return false;
        }

        if (value == Value)
        {
            check = true;

        }
        else
        {
            check = false;
        }
        con.Close();
        //sda.Dispose();
        con.Dispose();
        return check;
    }

    public static string GetSingleValue(string Querry)
    {

        string Value = string.Empty;
        String strConnString = DB_Configuration.DbConnectionString;
        SqlConnection con = new SqlConnection(strConnString);

        SqlCommand cmd = new SqlCommand(Querry);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            Value = cmd.ExecuteScalar().ToString();

        }
        catch (Exception ex)
        {
            //Utilities.LogError(ex);
            throw;
        }
        finally
        {
            con.Close();
            //sda.Dispose();
            con.Dispose();
        }
        return Value;
    }

    public static string GetSingleValue(SqlCommand cmd)
    {

        string Value = string.Empty;
        String strConnString = DB_Configuration.DbConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;



        try
        {
            con.Open();
            Value = cmd.ExecuteScalar().ToString();

        }
        catch (Exception ex)
        {
            //Utilities.LogError(ex);
            throw;
        }
        finally
        {
            con.Close();
            //sda.Dispose();
            con.Dispose();
        }
        return Value;
    }

    public static DataTable GetData(SqlCommand cmd)
    {

        DataTable dt = new DataTable();
        String strConnString = DB_Configuration.DbConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);

        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            con.Close();
            sda.Dispose();
            con.Dispose();
        }
        return dt;
    }
    public static DataTable GetDataByStoredProcedure(SqlCommand cmd)
    {
        DataTable dt = new DataTable();
        String strConnString = DB_Configuration.DbConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);

        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            con.Close();
            sda.Dispose();
            con.Dispose();
        }
        return dt;
    }
    public static DataTable GetData(string SqlQuerry)
    {

        DataTable dt = new DataTable();
        String strConnString = DB_Configuration.DbConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter sda = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand(SqlQuerry, con);
        cmd.CommandType = CommandType.Text;
        //cmd.Connection = con;
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);

        }
        catch (Exception)
        {
            throw;

        }
        finally
        {
            con.Close();
            sda.Dispose();
            con.Dispose();
            cmd.Dispose();
        }
        return dt;
    }
    public static string InsertExecuteScalar(SqlCommand cmd)
    {

        String strConnString = DB_Configuration.DbConnectionString;
        SqlConnection con = new SqlConnection(strConnString);

        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            string Value = cmd.ExecuteScalar().ToString();
            return Value;
        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            con.Close();
            con.Dispose();

        }
    }


    public static void InsertExecuteNonQuery(SqlCommand cmd)
    {

        String strConnString = DB_Configuration.DbConnectionString;
        SqlConnection con = new SqlConnection(strConnString);

        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteScalar();

        }
        catch (Exception)
        {
            
            throw;
        }
        finally
        {
            con.Close();
            con.Dispose();

        }
    }
    public static string InsertData(string SqlQuerry)
    {

        string strConnString = DB_Configuration.DbConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand(SqlQuerry, con);
        cmd.CommandType = CommandType.Text;
        //cmd.Connection = con;
        try
        {
            cmd.Connection.Open();
            //con.Open();
            string value = cmd.ExecuteScalar().ToString();
            return value;
        }
        catch (Exception)
        {
            throw;

        }
        finally
        {
            cmd.Connection.Close();
            con.Dispose();

        }

    }
    public static string ExecuteSqlTransaction(string sqlQuery1, string sqlQuery2)
    {
        string response = string.Empty;

        string strConnString = DB_Configuration.DbConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = con.CreateCommand();
        SqlTransaction sqlTrans;
        con.Open();
        sqlTrans = con.BeginTransaction("SampleTransaction");
        cmd.Connection = con;
        cmd.Transaction = sqlTrans;
        try
        {

            cmd.CommandText = sqlQuery1;
            //"Insert into [Acc_Account_Transaction] ([Trans_no], [Trans_Description],[Amount]) VALUES (100, 'Description','100')";
            cmd.ExecuteNonQuery();
            cmd.CommandText = sqlQuery2;
            //"Insert into [Acc_Account_Transaction] ([Trans_no], [Trans_Description],[Amount],[Acc_Id]) VALUES (101, 'Description','200')";
            cmd.ExecuteNonQuery();

            // Attempt to commit the transaction.
            sqlTrans.Commit();
            response = "Both records are written to database.";
        }
        catch (Exception ex)
        {
            response = "Commit Exception Type: " + ex.GetType();
            response = "Commit Exception Type: " + ex.Message;

            // Attempt to roll back the transaction. 
            try
            {
                sqlTrans.Rollback();
            }
            catch (Exception ex2)
            {
                // This catch block will handle any errors that may have occurred 
                // on the server that would cause the rollback to fail, such as 
                // a closed connection.
                response = "Rollback Exception Type: {0}" + ex2.GetType();
                response = "  Rollback Exception Type: " + ex2.Message;
            }
        }
        return response;
    }
}