using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NeedNameWebApp.ajax
{
    public partial class AddQRCodeScan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get parameter
            var iMemberID = Request.QueryString["memberid"];

            // Get database connection
            string connectionString = null;
            SqlConnection connection = default(SqlConnection);
            SqlCommand DBCmd = default(SqlCommand);
            
            connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();

            // Setup parameters for Stored procedure
            DBCmd = new SqlCommand();
            DBCmd.Connection = connection;

            //Active Connection
            DBCmd.CommandText = "sp_nn_AddRecord";

            // Stored Procedure to Call
            DBCmd.CommandType = CommandType.StoredProcedure;

            //Setup Command Type
            DBCmd.Parameters.Add("@bResult", System.Data.SqlDbType.VarChar, 1);
            DBCmd.Parameters["@bResult"].Direction = ParameterDirection.Output;

            DBCmd.Parameters.Add("@MemberName", System.Data.SqlDbType.VarChar, 255);
            DBCmd.Parameters["@MemberName"].Direction = ParameterDirection.Output;

            DBCmd.Parameters.Add("@MemberID", System.Data.SqlDbType.Int);
            DBCmd.Parameters["@MemberID"].Direction = ParameterDirection.Input;
            DBCmd.Parameters["@MemberID"].Value = iMemberID;

            // execute Stored Procedure
            try
            {
                DBCmd.ExecuteNonQuery();
            }
            catch (Exception g)
            {
                //Debug.WriteLine("An error occurred: '{0}'", g.Message);
            }

            string returnValue = (string)DBCmd.Parameters["@bResult"].Value;
            string sMemberName = (string)DBCmd.Parameters["@MemberName"].Value;

            if (returnValue == "Y")
            {
                Response.Write(sMemberName);
            }


            DBCmd.Connection.Close();

        }
    }
}