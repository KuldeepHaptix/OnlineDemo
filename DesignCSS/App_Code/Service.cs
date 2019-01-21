using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
    SqlCommand cmd = new SqlCommand();

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SaleskitCRMConnectionString"].ConnectionString);
    //public CompositeType GetDataUsingDataContract(CompositeType composite)
    //{
    //	if (composite == null)
    //	{
    //		throw new ArgumentNullException("composite");
    //	}
    //	if (composite.BoolValue)
    //	{
    //		composite.StringValue += "Suffix";
    //	}
    //	return composite;
    public void Delete(List<ParaList> para, string ModuleName)
    {
        try
        {
            cmd.Connection = con;
            cmd.CommandText = "usp_" + ModuleName + "_Delete";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            if (para != null)
            {
                foreach (var i in para)
                {
                  
                    cmd.Parameters.AddWithValue(i.Key, i.Value);
                }
            }
            con.Open();
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
            cmd.Parameters.Clear();
        }


    }

    public DataSet FillDDL(List<ParaList> para, string ModuleName)
    {
        DataSet ds = new DataSet();

        //   fghgyjyhjyjt
        try
        {
            cmd.Connection = con;
            cmd.CommandText = "usp_" + ModuleName + "_DDL";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            if (para != null)
            {
                foreach (var i in para)
                {
                    da.SelectCommand.Parameters.AddWithValue(i.Key, i.Value);
                }
            }
            con.Open();

            da.Fill(ds);

            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
            cmd.Parameters.Clear();
        }
        return ds;
    }

    public void Insert(List<ParaList> para, string ModuleName)
    {
        try
        {
            cmd.Connection = con;
            cmd.CommandText = "usp_" + ModuleName + "_Insert";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            if (para != null)
            {
                // SqlParameter p = null;
                //    foreach (var i in para)
                //    {
                //        p = new SqlParameter(i.Key, i.Value);
                //        cmd.Parameters.Add(p);
                //    }

                foreach (var i in para)
                {
                    cmd.Parameters.AddWithValue(i.Key, i.Value);
                }
            }

            con.Open();
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            cmd.Parameters.Clear();
            con.Close();
        }

    }

    public DataSet list(List<ParaList> para, string ModuleName)
    {
        DataSet ds = new DataSet();


        try
        {
            cmd.Connection = con;
            cmd.CommandText = "usp_" + ModuleName + "_List";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            if (para != null)
            {
                foreach (var i in para)
                {
                    da.SelectCommand.Parameters.AddWithValue(i.Key, i.Value);
                }
            }
            con.Open();
           // da.Update(ds);
            
            da.Fill(ds);
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
           
           // con.Close();
            //if (withOutPara == true)
            //{
            //    // Add output parameters ... 
            //    cmdSQLCommand.Parameters.Add("@o_ErrorMesg", SqlDbType.VarChar, 250).Direction = ParameterDirection.Output;
            //}


            //con.Open(); // Open Database Connection ... 
            //cmdSQLCommand.ExecuteNonQuery();


            //if (withOutPara == true) // Read values of Output Parameters 
            //{
            //    // Read Values of Output Paramters and Stored into Property 
            //    mErrorMsg = (string)(cmdSQLCommand.Parameters["@o_ErrorMesg"].Value);
            //}
            //else
            //{
            //    mErrorMsg = "";
            //}
        }
        catch (Exception ex)
        {
            //throw new ArgumentException(String.Format("error", ex.Data),
                                    // "ex");
            throw ex;
        }
        finally
        {
            cmd.Parameters.Clear();
            if (con.State == ConnectionState.Open) con.Close();
        }
        return ds;
    }



    public DataSet Select(List<ParaList> para, string ModuleName)
    {
        DataSet ds = new DataSet();

        try
        {
            cmd.Connection = con;
            cmd.CommandText = "usp_" + ModuleName + "_Select";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            if (para != null)
            {
                foreach (var i in para)
                {
                    da.SelectCommand.Parameters.AddWithValue(i.Key, i.Value);
                }
            }
            con.Open();

            da.Fill(ds);
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();

        }
        catch (Exception ex)
        {

            throw ex;
        }
        finally
        {
            cmd.Parameters.Clear();
            if (con.State == ConnectionState.Open) con.Close();
        }
        return ds;
    }

    public DataSet AutomaticNumber(List<ParaList> para)
    {
        DataSet ds = new DataSet();

        //   fghgyjyhjyjt
        try
        {
            cmd.Connection = con;
            cmd.CommandText = "usp_Automatic_Number";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            if (para != null)
            {
                foreach (var i in para)
                {
                    da.SelectCommand.Parameters.AddWithValue(i.Key, i.Value);
                }
            }
            con.Open();

            da.Fill(ds);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
        }
        return ds;

        // throw new NotImplementedException();
    }

    public void Update(List<ParaList> para, string ModuleName)
    {

        try
        {
            cmd.Connection = con;
            cmd.CommandText = "usp_" + ModuleName + "_Update";
            cmd.CommandType = CommandType.StoredProcedure;
            // SqlDataAdapter da = new SqlDataAdapter(cmd);
            if (para != null)
            {
                foreach (var i in para)
                {
                    cmd.Parameters.AddWithValue(i.Key, i.Value);
                }
            }

            con.Open();

            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            cmd.Parameters.Clear();
            con.Close();
        }

    }

    public DataSet LOV(List<ParaList> para, string ModuleName)
    {
        DataSet ds = new DataSet();

        try
        {
            cmd.Connection = con;
            cmd.CommandText = "usp_" + ModuleName + "_LOV";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            if (para != null)
            {
                foreach (var i in para)
                {
                    da.SelectCommand.Parameters.AddWithValue(i.Key, i.Value);
                }
            }
            con.Open();

            da.Fill(ds);
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();

        }
        catch (Exception ex)
        {

            throw ex;
        }
        finally
        {
            cmd.Parameters.Clear();
            if (con.State == ConnectionState.Open) con.Close();
        }
        return ds;
    }

    public DataSet InsertWithDataset(List<ParaList> para, string ModuleName)
    {
        DataSet ds = new DataSet();

        try
        {
            cmd.Connection = con;
            cmd.CommandText = "usp_" + ModuleName + "_Insert";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            if (para != null)
            {
                foreach (var i in para)
                {
                    da.SelectCommand.Parameters.AddWithValue(i.Key, i.Value);
                }
            }
            con.Open();

            da.Fill(ds);
            cmd.Parameters.Clear();
            // cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

            throw ex;
        }
        finally
        {
            cmd.Parameters.Clear();
            if (con.State == ConnectionState.Open) con.Close();
        }
        return ds;
    }
}
