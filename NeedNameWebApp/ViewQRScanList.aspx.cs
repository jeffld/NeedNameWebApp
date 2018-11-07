using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NeedNameWebApp
{
    public partial class ViewQRScanList : System.Web.UI.Page
    {
        // got code for pager using Stored procedure here
        // http://www.dotnetawesome.com/2014/02/how-to-implement-custom-paging-in-gridview-using-stored-procedure.html

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateData(1, 5);
            }

            AddpagingButton();
        }

        private void PopulateData(int pageNo, int noOfRecord)
        {
            // this method is for getting data from database based on selected page
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_nn_getData", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageNo", pageNo);
                cmd.Parameters.AddWithValue("@NoOfRecord", noOfRecord);

                SqlParameter TotalRecordSP = new SqlParameter("@TotalRecord", System.Data.SqlDbType.Int);
                TotalRecordSP.Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add(TotalRecordSP);

                DataTable dt = new DataTable();
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                dt.Load(cmd.ExecuteReader());

                int totalRecord = 0;
                if (TotalRecordSP.Value != null)
                {
                    int.TryParse(TotalRecordSP.Value.ToString(), out totalRecord);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();

                // Store Total Record & No of record per page into view state for use in Generate Paging button method
                ViewState["TotalRecord"] = totalRecord;
                ViewState["NoOfRecord"] = noOfRecord;
            }
        }

        private void AddpagingButton()
        {
            // this method for generate custom button for Custom paging in Gridview
            int totalRecord = 0;
            int noofRecord = 0;
            totalRecord = ViewState["TotalRecord"] != null ? (int)ViewState["TotalRecord"] : 0;
            noofRecord = ViewState["NoOfRecord"] != null ? (int)ViewState["NoOfRecord"] : 0;
            int pages = 0;
            if (totalRecord > 0 && noofRecord > 0)
            {
                // Count no of pages 
                pages = (totalRecord / noofRecord) + ((totalRecord % noofRecord) > 0 ? 1 : 0);
                for (int i = 0; i < pages; i++)
                {
                    Button b = new Button();
                    b.Text = (i + 1).ToString();
                    b.CommandArgument = (i + 1).ToString();
                    b.ID = "Button_" + (i + 1).ToString();
                    b.Click += new EventHandler(this.b_click);
                    Panel1.Controls.Add(b);
                }
            }

        }

        protected void b_click(object sender, EventArgs e)
        {
            // this is for Get data from Database on button (paging button) click
            string pageNo = ((Button)sender).CommandArgument;
            PopulateData(Convert.ToInt32(pageNo), 5);
        }

    }
}