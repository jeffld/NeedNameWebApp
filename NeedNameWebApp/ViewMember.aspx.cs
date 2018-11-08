using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

namespace NeedNameWebApp
{
    public partial class ViewMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get parameter
            var iMemberID = Request.QueryString["memberid"];

            string connectionString = null;
            SqlConnection connection = default(SqlConnection);

            connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();
            
            string SQL = "select * from nnMemberContractors where MemberID=" + iMemberID;

            SqlCommand DBCmd = new SqlCommand(SQL, connection);

            SqlDataReader myReader = DBCmd.ExecuteReader();
            
            if (!myReader.HasRows)
            {

            }
            else
            {

                while (myReader.Read())
                {

                    memberID.Text = myReader["MemberID"].ToString();
                    memberName.Text = myReader["MemberName"].ToString();

                }

                
            }


            myReader.Close();

            connection.Close();




        }
    }
}