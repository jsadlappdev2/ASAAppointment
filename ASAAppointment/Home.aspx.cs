using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ASAAppointment
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            int appnumber = GetAppoimentRecords(SearchTxt.Text.Trim());
            if (appnumber > 0)
            {
                RNLB.Text = "You have " + appnumber.ToString() + " appointments as below:";

                string sql = " select AppoId, Client_Name,convert(varchar, Appo_Date) as Appo_Date, left(convert(varchar,Appo_Time),5) as Appo_Time,Appo_Address,Contract_Tel, url from APPO_Clients where Query_Condition ='" + SearchTxt.Text.Trim() + "' order by appo_date asc";
                string connStr = ConfigurationManager.ConnectionStrings["ASADWH"].ConnectionString;
                SqlConnection connsql = new SqlConnection(connStr);
                if (connsql.State.ToString() == "Closed") connsql.Open();
                SqlCommand Cmd = new SqlCommand(sql, connsql);
                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = Cmd;
                sda.Fill(dt);
                GridView1.Visible = true;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

            else
            {
                GridView1.Visible = false;
                RNLB.Text = "You have no appointment at this moment.";
                
            }

        }


        private int GetAppoimentRecords(string ClientConditions)
        {
            Int32 RecordCount = 0;
            string connStrall = ConfigurationManager.ConnectionStrings["ASADWH"].ConnectionString;
            SqlConnection connsqlall = new SqlConnection(connStrall);
            if (connsqlall.State.ToString() == "Closed") connsqlall.Open();
            SqlCommand Cmdall = new SqlCommand("select count(*) from APPO_Clients where Query_Condition ='" + ClientConditions.Trim() + "' ", connsqlall);
            RecordCount = (Int32)Cmdall.ExecuteScalar();
            return RecordCount;
            connsqlall.Close();

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {

        }
    }
}