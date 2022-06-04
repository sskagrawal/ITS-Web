using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PagingControl : System.Web.UI.UserControl
{
    public event CustomDelegateClass.PageChangedEventHandler PageChanged;

    public int CurrentPageNumber { get; set; }
    public int TotalPage { get; set; }
    public int CurrentPageSize { get; set; }
    public int TotalRecords { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlPageNumber.Items.Clear();
            lblTotalRecords.Text = string.Empty;
  
            for (int count = 1; count <= this.TotalPage; ++count)
            {
                ddlPageNumber.Items.Add(count.ToString());
            }
            if (ddlPageNumber != null && ddlPageNumber.Items.Count > 0)
            {
                ddlPageNumber.Items[0].Selected = true;
                lblShowRecords.Text = string.Format("{0}", this.TotalPage.ToString());
                lblTotalRecords.Text = string.Format("{0}", this.TotalRecords.ToString());
                
                lblTotalPage.Text = Convert.ToString(ddlPageNumber.SelectedItem.Text);
                this.CurrentPageNumber = 1;
                SetUnsetLinkButtons();
            }
            if (string.IsNullOrEmpty(lblTotalRecords.Text.Trim()))
            {
                this.Visible = false;
            }
            else
            {
                this.Visible = true;
            }
        }
    }
    public void SetUnsetLinkButtons()
    {
        if (Convert.ToInt32(this.ddlPageSize.SelectedItem.Value) >= Convert.ToInt32(lblTotalRecords.Text))
        {
            imgbtnFirst.Enabled = false;
            imgbtnLast.Enabled = false;
            imgbtnPerivious.Enabled = false;
            imgbtnNext.Enabled = false;

            imgbtnFirst.ImageUrl = "~/img/first_Disable.jpg";
            imgbtnLast.ImageUrl = "~/img/last_Disable.jpg";
            imgbtnPerivious.ImageUrl = "~/img/previous_Disable.jpg";
            imgbtnNext.ImageUrl = "~/img/next_Disable.jpg";
        }
        else
        {
            if (this.CurrentPageNumber <= 1)
            {
                imgbtnFirst.Enabled = false;
                imgbtnLast.Enabled = true;
                imgbtnPerivious.Enabled = false;
                imgbtnNext.Enabled = true;

                imgbtnFirst.ImageUrl = "~/img/first_Disable.jpg";
                imgbtnLast.ImageUrl = "~/img/last.jpg";
                imgbtnPerivious.ImageUrl = "~/img/previous_Disable.jpg";
                imgbtnNext.ImageUrl = "~/img/next.jpg";
            }
            else if (this.CurrentPageNumber >= this.TotalPage)
            {
                imgbtnFirst.Enabled = true;
                imgbtnLast.Enabled = false;
                imgbtnPerivious.Enabled = true;
                imgbtnNext.Enabled = false;

                imgbtnFirst.ImageUrl = "~/img/first.jpg";
                imgbtnLast.ImageUrl = "~/img/last_Disable.jpg";
                imgbtnPerivious.ImageUrl = "~/img/previous.jpg";
                imgbtnNext.ImageUrl = "~/img/next_Disable.jpg";
            }
            else
            {
                imgbtnFirst.Enabled = true;
                imgbtnLast.Enabled = true;
                imgbtnPerivious.Enabled = true;
                imgbtnNext.Enabled = true;

                imgbtnFirst.ImageUrl = "~/img/first.jpg";
                imgbtnLast.ImageUrl = "~/img/last.jpg";
                imgbtnPerivious.ImageUrl = "~/img/previous.jpg";
                imgbtnNext.ImageUrl = "~/img/next.jpg";
            }
        }
    }


    protected void imgbtn_Click(object sender, EventArgs e)
    {
        CustomPageChangeArgs args = new CustomPageChangeArgs();
        args.CurrentPageSize = Convert.ToInt32(this.ddlPageSize.SelectedItem.Value);
        switch (((ImageButton)sender).ID)
        {
            case "imgbtnFirst": args.CurrentPageNumber = 1; HttpContext.Current.Items.Add("currentPage", 1);
                break;
            case "imgbtnPerivious": args.CurrentPageNumber = Convert.ToInt32(this.ddlPageNumber.SelectedItem.Value) - 1;
                break;
            case "imgbtnNext": args.CurrentPageNumber = Convert.ToInt32(this.ddlPageNumber.SelectedItem.Value) + 1;
                break;
            case "imgbtnLast": args.CurrentPageNumber = Convert.ToInt32(this.ddlPageNumber.Items.Count);
                break;
        }
        this.CurrentPageNumber = args.CurrentPageNumber;
        Pager_PageChanged(this, args);
        SetDropDownPageNumber(args.CurrentPageNumber);
        SetUnsetLinkButtons();
    }
    void Pager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        PageChanged(this, e);
    }
    private void SetDropDownPageNumber(int iCurrentPage)
    {
        if (ddlPageNumber.Items.Count > 0)
        {
            ddlPageNumber.SelectedIndex = iCurrentPage - 1;
        }
        lblTotalPage.Text = Convert.ToString(ddlPageNumber.SelectedItem.Text);
    }
    public void Reload()
    {
        ddlPageNumber.Items.Clear();
        lblTotalRecords.Text = string.Empty;
        for (int count = 1; count <= this.TotalPage; ++count)
        {
            ddlPageNumber.Items.Add(count.ToString());
        }
        if (ddlPageNumber != null && ddlPageNumber.Items.Count > 0)
        {
            ddlPageNumber.Items[0].Selected = true;
            lblShowRecords.Text = string.Format("{0}", this.TotalPage.ToString());
            lblTotalRecords.Text = string.Format("{0}", this.TotalRecords.ToString());
            lblTotalPage.Text = Convert.ToString(ddlPageNumber.SelectedItem.Text);
            this.CurrentPageNumber = 1;
            SetUnsetLinkButtons();
        }
        if (string.IsNullOrEmpty(lblTotalRecords.Text.Trim()))
        {
            this.Visible = false;
        }
        else
        {
            this.Visible = true;
        }
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        CustomPageChangeArgs args = new CustomPageChangeArgs();
        args.CurrentPageSize = Convert.ToInt32(this.ddlPageSize.SelectedItem.Value);
        args.CurrentPageNumber = 1;
        args.TotalPages = Convert.ToInt32(this.lblShowRecords.Text);
        Pager_PageChanged(this, args);
        ddlPageNumber.Items.Clear();
        for (int count = 1; count <= this.TotalPage; ++count)
        {
            ddlPageNumber.Items.Add(count.ToString());
        }
        ddlPageNumber.Items[0].Selected = true;
        lblShowRecords.Text = string.Format("{0}",this.TotalPage.ToString());
        lblTotalPage.Text = Convert.ToString(ddlPageNumber.SelectedItem.Text);
        this.CurrentPageNumber = args.CurrentPageNumber;
        SetUnsetLinkButtons();
    }
    protected void ddlPageNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        CustomPageChangeArgs args = new CustomPageChangeArgs();
        args.CurrentPageSize = Convert.ToInt32(this.ddlPageSize.SelectedItem.Value);
        args.CurrentPageNumber = Convert.ToInt32(this.ddlPageNumber.SelectedItem.Text);
        args.TotalPages = Convert.ToInt32(this.lblShowRecords.Text);
        Pager_PageChanged(this, args);
        lblShowRecords.Text = string.Format("{0}", this.TotalPage.ToString());
        lblTotalPage.Text = Convert.ToString(ddlPageNumber.SelectedItem.Text);
        this.CurrentPageNumber = args.CurrentPageNumber;
        SetUnsetLinkButtons();
    }
}