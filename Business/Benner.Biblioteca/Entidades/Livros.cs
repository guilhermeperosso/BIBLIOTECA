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
    
    
    /// <summary>
    /// Nome da Tabela: LIVROS.
    /// Essa é uma classe parcial, os atributos, herança e propriedades estão definidos no arquivo Livros.properties.cs
    /// </summary>
    public partial class Livros
    {
        protected override void Creating()
        {
            NumeroEmprestimos = 0;
            base.Creating();
        }

    }
}
