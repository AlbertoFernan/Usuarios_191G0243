using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Usuarios_191G0243.Models;

namespace Usuarios_191G0243.Repositories
{
    class LoginRepository
    {
        usuariosContext context = new usuariosContext();

        public static String GetMD5Hash(string input)
        {
            MD5CryptoServiceProvider x = new MD5CryptoServiceProvider();
            byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);
            bs = x.ComputeHash(bs);
            StringBuilder s = new StringBuilder();
            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            string hash = s.ToString();
            return hash;
        }

        public void Login(Usuario u)
        {
            context.Database.ExecuteSqlRaw($"call sp_InicioSesion" + $"('{u.EMail}','{(u.Contraseña)}')");
            context.SaveChanges();

        }

        public bool ValidateLogin(Usuario us) {
            if (string.IsNullOrWhiteSpace(us.EMail))
            {
                throw new ArgumentException("Especifique un correo");
            }
            if (string.IsNullOrWhiteSpace(us.Contraseña))
            {
                throw new ArgumentException("Especifique una Contraseña");
            }

            if (!context.Usuarios.Any(x=>x.EMail==us.EMail && x.Contraseña==GetMD5Hash(us.Contraseña)))
            {
                throw new ArgumentException("Correo o contraseña incorrecta");
            }

            return true;
           
        
        }

    }
}
