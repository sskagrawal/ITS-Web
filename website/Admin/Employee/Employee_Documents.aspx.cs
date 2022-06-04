using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Employee_Employee_Documents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if(!IsPostBack)
        {
            BindEmployee();
            BindEmployeeDocument();
        }
    }



    public void BindEmployeeDocument()
    {
        DataTable dt = DataAccess.GetData("Select * from [Employee_Document]");
        if (dt.Rows.Count>0)
        {
            grdDocument.DataSource = dt;
            grdDocument.DataBind();
        }
    }

    public void BindEmployee()
    {

        //    DataTable dt = DataAccess.GetData("Select * from Student_Enrollment");

        //    if (dt.Rows.Count > 0)
        //    {
        //        drdEnroll.DataSource = dt;
        //        drdEnroll.DataTextField = "Enrollment_No";
        //        drdEnroll.DataValueField = "Enrollment_Id";
        //        drdEnroll.DataBind();

        //    }




        drdEmployee.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Enrollment-";
        item1.Value = "0";
        drdEmployee.Items.Add(item1);
        DataTable dt = DataAccess.GetData("select * from [UserDetails]  where UserTypeID=7");

        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["ID"].ToString();
                item.Text = dr["Name"].ToString();
                drdEmployee.Items.Add(item);


            }
        }

    }






    protected void btnSubmit_Click(object sender, EventArgs e)
    {


        string targetPath = string.Empty;

        if (fluPorUpload.HasFile)
        {
            if (File.Exists(Server.MapPath("~/Employee_Document_File/" + hdfImage.Value)))
            {
                File.Delete(Server.MapPath("~/Employee_Document_File/" + hdfImage.Value));
            }

            fluPorUpload.SaveAs(Server.MapPath("~/Employee_Document_File/" + fluPorUpload.FileName));
            hdfImage.Value = fluPorUpload.FileName;
        }
        if (fluPorUpload.PostedFile != null)
        {
            // Check the extension of image  
            string extension = Path.GetExtension(fluPorUpload.FileName);
            if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg")
            {
                Stream strm = fluPorUpload.PostedFile.InputStream;
                using (var image = System.Drawing.Image.FromStream(strm))
                {

                    int newWidth = 800; // New Width of Image in Pixel  
                    int newHeight = 489; // New Height of Image in Pixel  
                    var thumbImg = new Bitmap(newWidth, newHeight);
                    var thumbGraph = Graphics.FromImage(thumbImg);
                    thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                    thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                    thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                    thumbGraph.DrawImage(image, imgRectangle);
                    // Save the file  
                    targetPath = Server.MapPath(@"~\Employee_Document_File\") + fluPorUpload.FileName;
                    thumbImg.Save(targetPath, image.RawFormat);
                    hdfImage.Value = fluPorUpload.FileName;

                }
            }
        }
        //else
        //{

        //}
        else
        {
            if (fluPorUpload.HasFile)
            {
                if (File.Exists(Server.MapPath("~/Employee_Document_File/" + hdfImage.Value)))
                {
                    File.Delete(Server.MapPath("~/Employee_Document_File/" + hdfImage.Value));
                }

                fluPorUpload.SaveAs(Server.MapPath("~/Employee_Document_File/" + fluPorUpload.FileName));
                hdfImage.Value = fluPorUpload.FileName;
            }
        }



        if (hdfID.Value == string.Empty)
        {

            SqlCommand cmd = new SqlCommand("Insert into [Employee_Document] ([Employee_Name],[Document_Name],[Upload_Document]) Values(@Employee_Name,@Document_Name,@Upload_Document)");
            cmd.Parameters.AddWithValue("@Employee_Name", drdEmployee.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Document_Name", drdDocument.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Upload_Document", hdfImage.Value);
            DataAccess.InsertExecuteNonQuery(cmd);

            alert.Visible = true;

            lblMsg.Text = "Documents Inserted";

            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "HideLabel();", true);



        }
        else
        {

            SqlCommand cmd = new SqlCommand("update Employee_Document set Employee_Name=@Employee_Name,Document_Name=@Document_Name,Upload_Document=@Upload_Document where Employee_Document_ID=" + hdfID.Value + "");
            cmd.Parameters.AddWithValue("@Employee_Name", drdEmployee.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Document_Name", drdDocument.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Upload_Document", hdfImage.Value);

            DataAccess.InsertExecuteNonQuery(cmd);


            alert.Visible = true;
            lblMsg.Text = "This  Document has been Updated";
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "HideLabel();", true);
        }

        BindEmployeeDocument();

    }

    protected void imgbtnUpdate_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton bt = sender as ImageButton;
        GridViewRow grdrow = (GridViewRow)bt.NamingContainer;

        string m_id = (((HiddenField)(grdrow.FindControl("hdfEdit"))).Value).ToString();
        hdfID.Value = m_id;


        Bind();

    }
    public void Bind()
    {

        DataTable dt = DataAccess.GetData("Select * from [Employee_Document] where [Employee_Document_ID]=" + hdfID.Value + "");


        if (dt.Rows.Count > 0)
        {
            drdEmployee.SelectedItem.Text = dt.Rows[0]["Employee_Name"].ToString();
            drdDocument.SelectedItem.Text = dt.Rows[0]["Document_Name"].ToString();
            hdfImage.Value = dt.Rows[0]["Upload_Document"].ToString();
            btnSubmit.Text = "Update";
        }
    }
    protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton bt = sender as ImageButton;
        GridViewRow grdrow = (GridViewRow)bt.NamingContainer;

        string m_id = (((HiddenField)(grdrow.FindControl("hdfDel"))).Value).ToString();

        SqlCommand cmd = new SqlCommand("Delete from  [Employee_Document] where [Employee_Document_ID]=" + m_id + "");
        DataAccess.InsertExecuteNonQuery(cmd);
        alert.Visible = true;
        lblMsg.Text = "This  Document has been Deleted";
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "HideLabel();", true);
        BindEmployeeDocument();

    }


    public void ClearText()
    {
        drdEmployee.SelectedValue = null;
        drdDocument.SelectedValue = null;
        hdfImage.Value = string.Empty;
       
    }


}