using System;
using System.Collections.Generic;

#nullable disable

namespace Usuarios_191G0243.Models
{
    public partial class Bitacora
    {
        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public int UsuarioId { get; set; }
        public string Descripcion { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
