using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void btnSubmit_Click(object sender, EventArgs e)
    {
        courseNameValidator.Validate();
        courseNumberValidator.Validate();

        if(courseNumberValidator.IsValid && courseNameValidator.IsValid)
        {
            Course c = new Course(CourseNumber.Text, CourseName.Text);

            Session["course"] = c;

            Response.Redirect("StudentRecords.aspx");
        }

        /*ArrayList courselist;

        if (Session["courselist"] == null)
        {
            courselist = new ArrayList();
        }
        else
        {
            courselist = (ArrayList)Session["courselist"];
        }

        courselist.Add(c);
        Session["courselist"] = courselist;*/
    }
}