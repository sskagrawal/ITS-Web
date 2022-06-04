<%@ Application Language="C#" %>

<script runat="server">
    protected void Application_BeginRequest(object sender, EventArgs e)
    {
        string origionalpath = Request.Url.ToString();
        string subPath = string.Empty;
        string blogId = string.Empty;
        int id = 0;
        if (origionalpath.Contains("Blogs"))
        {
            if (origionalpath.Length >= 22)
            {
                subPath = origionalpath.Substring(22);
                if (subPath.Length >= 1)
                {
                    blogId = Regex.Match(subPath, @"\d+").Value;
                    bool isValid = Int32.TryParse(blogId, out id);
                    if (isValid)
                    {
                        Context.RewritePath("BlogShow.aspx?id=" + id);
                    }
                }
            }
        }
        if (origionalpath.Contains("/Job/"))
        {
            string pat = origionalpath;
            //if (origionalpath.Contains("find-job"))
            //{
            if (origionalpath.Length >= 22)
            {
                subPath = origionalpath.Substring(22);
                if (subPath.Length >= 1)
                {
                    blogId = Regex.Match(subPath, @"\d+").Value;
                    bool isValid = Int32.TryParse(blogId, out id);
                    if (isValid)
                    {
                        Context.RewritePath("Job_full_Profile.aspx?id=" + id);
                    }
                }
            }
            // }
        }
        if (origionalpath.Contains("/Jobseeker/"))
        {
            string pat = origionalpath;
            //if (origionalpath.Contains("find-job"))
            //{
            if (origionalpath.Length >= 22)
            {
                subPath = origionalpath.Substring(22);
                if (subPath.Length >= 1)
                {
                    blogId = Regex.Match(subPath, @"\d+").Value;
                    bool isValid = Int32.TryParse(blogId, out id);
                    if (isValid)
                    {
                        Context.RewritePath("EmpFullProfile.aspx?pId=" + id);
                    }
                }
            }
            // }
        }
    }
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
