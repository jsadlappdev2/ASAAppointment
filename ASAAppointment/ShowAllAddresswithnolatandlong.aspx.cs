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
    public partial class ShowAllAddresswithnolatandlong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)

            {

                DataTable dt = this.GetData("select * from GovHack_EmergencyService where [latitude] is not null  ");

                rptMarkers.DataSource = dt;

                rptMarkers.DataBind();

            }
        }

        private DataTable GetData(string query)

        {

            string conString = ConfigurationManager.ConnectionStrings["ASADWH"].ConnectionString;

            SqlCommand cmd = new SqlCommand(query);

            using (SqlConnection con = new SqlConnection(conString))

            {

                using (SqlDataAdapter sda = new SqlDataAdapter())

                {

                    cmd.Connection = con;



                    sda.SelectCommand = cmd;

                    using (DataTable dt = new DataTable())

                    {

                        sda.Fill(dt);

                        return dt;

                    }

                }

            }

        }
    }
}