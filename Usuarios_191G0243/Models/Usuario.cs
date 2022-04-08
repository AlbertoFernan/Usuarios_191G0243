using System;
using System.Collections.Generic;

#nullable disable

namespace Usuarios_191G0243.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            Bitacoras = new HashSet<Bitacora>();
        }

        public int Id { get; set; }
        public string EMail { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Contraseña { get; set; }

        public virtual ICollection<Bitacora> Bitacoras { get; set; }
    }
}
