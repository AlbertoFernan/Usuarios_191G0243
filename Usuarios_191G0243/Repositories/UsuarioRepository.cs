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
    class UsuarioRepository
    {

        usuariosContext context = new usuariosContext();

        public IEnumerable<Usuario> GetAll()
        {
            return context.Usuarios.OrderBy(x => x.Nombre);
        }

        public Usuario GetByEMail(Usuario u)
        {
            return context.Usuarios.FirstOrDefault(x => x.EMail == u.EMail);
        }


        public void Update(Usuario u)
        {
           


            Usuario UserCopia = context.Usuarios.FirstOrDefault(x => x.Id == u.Id);
                if (UserCopia != null)
                {
                    UserCopia.Id = u.Id;
                    UserCopia.EMail = u.EMail;
                    UserCopia.Direccion= u.Direccion;
                    UserCopia.Nombre = u.Nombre;
                    UserCopia.Telefono = u.Telefono;
                    UserCopia.Contraseña = GetMD5Hash(u.Contraseña);

                context.Database.ExecuteSqlRaw($"call sp_EditarDatos" +
$"('{u.EMail}','{u.Nombre}','{u.Direccion}'," +
$"'{u.Telefono}','{u.Contraseña}');");
                context.SaveChanges();
                }
            



        }

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

        public void Insert(Usuario u)
        {
            if (context.Usuarios.Count(x => x.EMail == u.EMail) > 0)
            {
                throw new ArgumentException("El correo ya esta registrado");
            }
            context.Database.ExecuteSqlRaw($"call sp_Registro" +
$"('{u.EMail}','{u.Nombre}','{u.Direccion}'," +
$"'{u.Telefono}','{u.Contraseña}');");
            context.SaveChanges();

        }

       

        public void Delete(Usuario u)
        {

            if (u == null)
            {
                throw new ArgumentException("Eliga un registro para eliminar");
            }
            else
            {
                context.Remove(u);
                context.SaveChanges();
            }

        }


        public bool Validate(Usuario u)
        {
            if (string.IsNullOrWhiteSpace(u.EMail))
            {
                throw new ArgumentException("Especifique un correo");
            }
         
            if (string.IsNullOrWhiteSpace(u.Nombre))
            {
                throw new ArgumentException("Especifique un nombre para el usuario");
            }


            if (string.IsNullOrWhiteSpace(u.Direccion))
            {
                throw new ArgumentException("Especifique una Dirección");
            }

         
            if (string.IsNullOrWhiteSpace(u.Telefono))
            {
                throw new ArgumentException("Especifique un Teléfono");
            }
            if (string.IsNullOrWhiteSpace(u.Contraseña))
            {
                throw new ArgumentException("Especifique una Contraseña");
            }

            return true;

        }
    }
}
