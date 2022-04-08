using GalaSoft.MvvmLight.Command;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Usuarios_191G0243.Models;
using Usuarios_191G0243.Repositories;
using Usuarios_191G0243.Views;

namespace Usuarios_191G0243.ViewModels
{
    class UsuariosViewModel:INotifyPropertyChanged
    {
        public ICommand VerRegistrarCommand { get; set; }
        public ICommand RegistrarCommand { get; set; }

        public ICommand IniciarSesionCommand { get; set; }

        public ICommand VerEditarCommand { get; set; }

        public ICommand EditarCommand { get; set; }
        public UsuariosViewModel()
        {
            VerRegistrarCommand = new RelayCommand(VerRegistrar);
            RegistrarCommand = new RelayCommand(Registrar);
            IniciarSesionCommand = new RelayCommand(IniciarSesion);
            VerEditarCommand = new RelayCommand<Usuario> (VerEditar);
            EditarCommand = new RelayCommand(Editar);
            Us = new Usuario();
        }

        RegistrarUsuarioView regiview = new RegistrarUsuarioView();
        AdministrarView Adminview = new AdministrarView();
        EditarView editview = new EditarView();

        private Usuario us;
        public Usuario Us
        {
            get { return us; }
            set
            {
                us = value;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("Us"));
            }
        }




        public event PropertyChangedEventHandler PropertyChanged;

        private string error;
        public string Error
        {
            get { return error; }
            set
            {
                error = value;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("Error"));
            }
        }
     

        void VerEditar(Usuario u)
        {
            u=repo.GetByEMail(u);
            
            Error = "";
            if (u != null)
            {
                Usuario copia = new Usuario()
                {
                    Nombre = u.Nombre,
                    EMail = u.EMail,
                    Direccion = u.Direccion,
                    Telefono = u.Telefono,
                    Contraseña = null,
                    Id = u.Id
                };
                Us = copia;
                editview = new EditarView();
                editview.DataContext = this;
                editview.ShowDialog();
            }

        }

        void Editar()
        {
            Error = " ";
            try
            {

           
            if(repo.Validate(Us)==true)
            {
                repo.Update(Us);
                editview.Close();
                Error = " ";
            }
            }
            catch(Exception ex)
            {
                Error = ex.Message;
            }

        }

        void VerRegistrar()
        {
            Error = "";
            regiview = new RegistrarUsuarioView();
            Us = new Usuario();
            regiview.DataContext = this;
            regiview.ShowDialog();
        }

        UsuarioRepository repo = new UsuarioRepository();
        LoginRepository loginrep = new LoginRepository();
        void Registrar()
        {
            Error = "";
            try { 
            if (repo.Validate(Us)!=false )
            {
                repo.Insert(Us);
  
                    regiview.Close();
                    Us = new Usuario();
            }
            }
            catch(Exception ex)
            {
                Error = ex.Message;
            }


        }

        void IniciarSesion()
        {
            Error = "";
            try
            {

               if(loginrep.ValidateLogin(us)==true)
                {
                    loginrep.Login(us);
                    Adminview = new AdministrarView();
                    Adminview.DataContext = this;
                    Adminview.ShowDialog();

                }

                     
                
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }





        }






    }
}
