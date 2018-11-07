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
    public partial class AddMemberSkill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveData_Click(object sender, EventArgs e)
        {
            string sMemberID = memberID.Text;
            string sSkillID = skillID.Text;
            string sSkillDescription = skillDescription.Text;
            string sCertificationDate = certificationDate.Text;
            string sExpirationDate = expirationDate.Text;
            string sTrainingCompany = trainingCompany.Text;
            string sTrainerName = trainerName.Text;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("insert into nnMemberSkills (MemberID,SkillID,SkillDescription,CertificationDate,ExpirationDate,TrainingCompany,TrainerName) VALUES ( @MemberID,@SkillID,@SkillDescription,@CertificationDate,@ExpirationDate,@TrainingCompany,@TrainerName)"))
                {

                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@MemberID", sMemberID);
                    cmd.Parameters.AddWithValue("@SkillID", sSkillID);
                    cmd.Parameters.AddWithValue("@SkillDescription", sSkillDescription);
                    cmd.Parameters.AddWithValue("@CertificationDate", sCertificationDate);
                    cmd.Parameters.AddWithValue("@ExpirationDate", sExpirationDate);
                    cmd.Parameters.AddWithValue("@TrainingCompany", sTrainingCompany);
                    cmd.Parameters.AddWithValue("@TrainerName", sTrainerName);

                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            memberID.Text = "";
            skillID.Text = "";
            skillDescription.Text = "";
            certificationDate.Text = "";
            expirationDate.Text = "";
            trainingCompany.Text = "";
            trainerName.Text = "";


        }
    }
}