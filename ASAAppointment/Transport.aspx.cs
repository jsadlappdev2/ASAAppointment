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
    public partial class Transport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string appid= Request.QueryString["AppoID"];
           

            string sql = " select AppoId, Client_Name,convert(varchar, Appo_Date) as Appo_Date, left(convert(varchar,Appo_Time),5) as Appo_Time,Appo_Address,Contract_Tel, url, C_Address+', '+Suburb+', SA '+C_PostCode as FAdress from APPO_Clients where AppoId ='" + appid + "' order by appo_date asc";
            string connStr = ConfigurationManager.ConnectionStrings["ASADWH"].ConnectionString;
            SqlConnection connsql = new SqlConnection(connStr);
            if (connsql.State.ToString() == "Closed") connsql.Open();
            SqlCommand Cmd = new SqlCommand(sql, connsql);
            SqlDataReader sdr = Cmd.ExecuteReader();
            while (sdr.Read())
            {
               ADate.Text = sdr["Appo_Date"].ToString();
               ATime.Text = sdr["Appo_Time"].ToString();
               ATel.Text = sdr["Contract_Tel"].ToString();
               Aname.Text = sdr["Client_Name"].ToString();
               AAdress.Text = sdr["Appo_Address"].ToString();
               AFAdress.Text = sdr["FAdress"].ToString();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }
    }
}