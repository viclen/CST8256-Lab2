using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentRecords : System.Web.UI.Page
{
    Course course;

    public class SortById : IComparer
    {
        int IComparer.Compare(Object x, Object y)
        {
            Student a = (Student)x;
            Student b = (Student)y;
            return ((new CaseInsensitiveComparer()).Compare(a.ID, b.ID));
        }
    }

    public class SortByName : IComparer
    {
        int IComparer.Compare(Object x, Object y)
        {
            Student a = (Student)x;
            Student b = (Student)y;

            if (a.Name.Equals(b.Name))
            {
                return ((new CaseInsensitiveComparer()).Compare(a.ID, b.ID));
            }

            if(a.Name.Split(' ')[1].Equals(b.Name.Split(' ')[1]))
            {
                return ((new CaseInsensitiveComparer()).Compare(a.Name, b.Name));
            }
            else
            {
                return ((new CaseInsensitiveComparer()).Compare(a.Name.Split(' ')[1], b.Name.Split(' ')[1]));
            }
        }
    }

    public class SortByGrade : IComparer
    {
        int IComparer.Compare(Object x, Object y)
        {
            Student a = (Student)x;
            Student b = (Student)y;

            if(a.Grade == b.Grade)
            {
                return ((IComparer)new SortByName()).Compare(x, y);
            }

            return a.Grade < b.Grade ? 1 : -1;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["course"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        course = (Course)Session["course"];
        Page.Title = course.CourseName;

        if (course.GetStudents().Count <= 0)
        {
            TableRow row = new TableRow();
            TableCell cell = new TableCell();
            cell.Text = "No Student Record Exist!";
            cell.ForeColor = System.Drawing.Color.Red;
            cell.ColumnSpan = 3;
            cell.HorizontalAlign = HorizontalAlign.Center;
            row.Cells.Add(cell);
            tblStudents.Rows.Add(row);
        }
        else
        {
            foreach (Student student in course.GetStudents())
            {
                TableRow row = new TableRow();

                TableCell cell = new TableCell();
                cell.Text = student.ID;
                row.Cells.Add(cell);

                cell = new TableCell();
                cell.Text = student.Name;
                row.Cells.Add(cell);

                cell = new TableCell();
                cell.Text = student.Grade + "";
                row.Cells.Add(cell);

                tblStudents.Rows.Add(row);
            }
        }
    }

    public void btnSubmit_Click(object sender, EventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            course.AddStudent(new Student(studentID.Text, studentName.Text, studentGrade.Text));
            Session["course"] = course;
        }

        Response.Redirect("StudentRecords.aspx");
    }

    public void changeOrder(object sender, EventArgs e)
    {
        if (radioId.Checked)
        {
            Session["order"] = "id";
        }
        else if (radioName.Checked)
        {
            Session["order"] = "name";
        }
        else
        {
            Session["order"] = "grade";
        }
        Response.Redirect("StudentRecords.aspx");
    }

    public void orderList(object sender, EventArgs e)
    {
        Course course = (Course)Session["course"];

        TableRow header = tblStudents.Rows[0];
        tblStudents.Rows.Clear();
        tblStudents.Rows.Add(header);

        ArrayList list = course.GetStudents();

        if (radioId.Checked)
        {
            IComparer comparer = new SortById();
            list.Sort(comparer);
        }
        else if (radioName.Checked)
        {
            IComparer comparer = new SortByName();
            list.Sort(comparer);
        }
        else if (radioGrade.Checked)
        {
            list.Sort((IComparer)new SortByGrade());
        }

        foreach (Student student in list)
        {
            TableRow row = new TableRow();

            TableCell cell = new TableCell();
            cell.Text = student.ID;
            row.Cells.Add(cell);

            cell = new TableCell();
            cell.Text = student.Name;
            row.Cells.Add(cell);

            cell = new TableCell();
            cell.Text = student.Grade + "";
            row.Cells.Add(cell);

            tblStudents.Rows.Add(row);
        }
    }
}