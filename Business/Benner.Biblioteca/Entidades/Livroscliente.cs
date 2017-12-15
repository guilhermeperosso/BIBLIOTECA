using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization;
using System.Text;


namespace Benner.Biblioteca.Entidades
{

    public partial interface ILivroscliente
    {
        void VinculaLivroCliente(IClientes cliente, ILivros livro);
    }

    /// <summary>
    /// Nome da Tabela: LIVROSCLIENTE.
    /// Essa é uma classe parcial, os atributos, herança e propriedades estão definidos no arquivo Livroscliente.properties.cs
    /// </summary>
    public partial class Livroscliente
    {
        private readonly ILivrosclienteDao _livroClienteDao = LivrosclienteDao.CreateInstance();

        public void VinculaLivroCliente(IClientes cliente, ILivros livro)
        {
            ClienteInstance = cliente;
            LivroInstance = livro;
            _livroClienteDao.Save(this);
        }

        protected override void Getting()
        {

            if (ClienteInstance.UsuarioInstance.Apelido == BennerContext.Security.GetLoggedUserName())
            {
                Ativo = true;
            }
            else
            {
                Ativo = false;
            }
            base.Getting();
        }

    }
}
