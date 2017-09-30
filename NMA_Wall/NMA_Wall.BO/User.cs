﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using NMA_Wall.BO.Extensions;

namespace NMA_Wall.BO
{
    public class User
    {
        public Guid Id { get; protected set; }

        public bool IsSuperAdmin { get; protected set; }
        public bool IsContribruter { get; protected set; }
        public bool IsAdmin { get; protected set; }

        public string Username { get; protected set; }
        public string Password { get; protected set; }

        public DateTime DateAdded { get; private set; }

        public void ChangeUserType(bool isContribruter = false, bool isAdmin = false, bool isSuperAdmin = false)
        {
            this.IsContribruter = isContribruter;
            this.IsAdmin = isAdmin;
            this.IsSuperAdmin = isSuperAdmin;
        }

        public void ResetPassword(string username, bool isContribruter = false, bool isAdmin = false, bool isSuperAdmin = false)
        {
            if (this.Username == username)
            {
                if (this.IsContribruter == isContribruter && IsAdmin == isAdmin && IsSuperAdmin == isSuperAdmin)
                {
                    this.Password = "NMA_User";
                }
            }
        }

        public void ChangePassword(string currentPassword, string newPassword)
        {
            if (this.Password == currentPassword.ComputeHash())
            {
                this.Password = newPassword.ComputeHash();
            }
        }

        public User(string username, string password, bool isContribruter = false, bool isAdmin = false, bool isSuperAdmin = false) : this()
        {
            Username = username;
            Password = password.ComputeHash();
            IsContribruter = isContribruter;
            IsAdmin = isAdmin;
            IsSuperAdmin = isSuperAdmin;
        }

        public User()
        {
            DateAdded = DateTime.Now;
        }
    }
}
