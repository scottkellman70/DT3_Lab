using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DT3_Lab
{
    public partial class NewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAccessLevels();
            }
        }

        private void LoadAccessLevels()
        {
            List<string> list = Database.Get.UserAccessLevels();

            if (list.Count > 0)
            {
                foreach (string item in list)
                {
                    ListItem listItem = new ListItem(item);
                    DropDownListUserRoles.Items.Add(listItem);
                }
            }
        }
        protected void ButtonSaveUser_Click(object sender, EventArgs e)
        {
            if (!TextBoxPassword.Text.Equals(TextBoxVerifyPassword.Text))
            {
                LabelResult.Text = "Password and verify passwords do not match.  Please try again.";
                return;
            }

            int cnt = Database.Get.CheckUserCount(TextBoxUserName.Text.Trim());
            if (cnt < 1)
            {
                int result = Database.Insert.User(TextBoxUserName.Text.Trim()
                    , Utilities.Encrypt(TextBoxPassword.Text.Trim())
                    , DropDownListUserRoles.SelectedItem.ToString()
                    , TextBoxFullName.Text.Trim());

                if (result != 0)
                {
                    LabelResult.Text = string.Format("There was an error saving the new user({0}).", TextBoxUserName.Text);
                }
                {
                    LabelResult.Text = string.Format("New user {0} added.", TextBoxUserName.Text);
                }
            }
            else
            {
                LabelResult.Text = string.Format("New user {0} already exists. Please try again.", TextBoxUserName.Text);
            }
        }
    }
}