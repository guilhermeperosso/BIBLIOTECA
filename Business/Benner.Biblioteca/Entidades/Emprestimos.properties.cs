﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

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
    /// Interface para a tabela EMPRESTIMOS
    /// </summary>
    public partial interface IEmprestimos : IEntityBase
    {
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        Benner.Tecnologia.Common.IEntityBase ClienteInstance
        {
            get;
            set;
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        Handle ClienteHandle
        {
            get;
            set;
        }
        
        /// <summary>
        /// Data de Devolução (DATADEVOLUCAO.)
        /// Opcional = N, Invisível = False, Formato Data = Dia, Mês, Ano - Formato Hora = Sem hora
        /// </summary>
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        System.Nullable<System.DateTime> DataDevolucao
        {
            get;
            set;
        }
        
        /// <summary>
        /// Data final (DATAFIM.)
        /// Opcional = N, Invisível = False, Formato Data = Dia, Mês, Ano - Formato Hora = Sem hora
        /// </summary>
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        System.Nullable<System.DateTime> DataFinal
        {
            get;
            set;
        }
        
        /// <summary>
        /// Datainicio (DATAINICIO.)
        /// Opcional = N, Invisível = False, Formato Data = Dia, Mês, Ano - Formato Hora = Sem hora
        /// </summary>
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        System.Nullable<System.DateTime> Datainicio
        {
            get;
            set;
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        Benner.Biblioteca.Entidades.ILivros LivroInstance
        {
            get;
            set;
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        Handle LivroHandle
        {
            get;
            set;
        }
    }
    
    /// <summary>
    /// Interface para o DAO para a tabela EMPRESTIMOS
    /// </summary>
    public partial interface IEmprestimosDao : IBusinessEntityDao<IEmprestimos>
    {
    }
    
    /// <summary>
    /// DAO para a tabela EMPRESTIMOS
    /// </summary>
    public partial class EmprestimosDao : BusinessEntityDao<Emprestimos, IEmprestimos>, IEmprestimosDao
    {
        
        public static EmprestimosDao CreateInstance()
        {
            return CreateInstance<EmprestimosDao>();
        }
    }
    
    /// <summary>
    /// Emprestimos
    /// </summary>
    [EntityDefinitionName("EMPRESTIMOS")]
    [DataContract(Namespace = "http://Benner.Tecnologia.Common.DataContracts/2007/09", Name = "EntityBase")]
    public partial class Emprestimos : BusinessEntity<Emprestimos>, IEmprestimos
    {
        
        /// <summary>
        /// Possui constantes para retornarem o nome dos campos definidos no Builder para cada propriedade
        /// </summary>
		public static class FieldNames
		{
			public const string Cliente = "CLIENTE";
			public const string DataDevolucao = "DATADEVOLUCAO";
			public const string DataFinal = "DATAFIM";
			public const string Datainicio = "DATAINICIO";
			public const string Livro = "LIVRO";
		}

        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        public Benner.Tecnologia.Common.IEntityBase ClienteInstance
        {
            get
            {
                if (Cliente.Handle == null)
                {
					return null;
                }
                return Cliente.Instance;
            }
            set
            {
                if (value == null)
                {
					Cliente = null;
					return;
                }
                Cliente.Instance = (EntityBase) value;
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        public Handle ClienteHandle
        {
            get
            {
                return Cliente.Handle;
            }
            set
            {
                Cliente.Handle = value;
            }
        }
        
        /// <summary>
        /// Cliente (CLIENTE.)
        /// Opcional = N, Invisível = False, Pesquisar = CLIENTES
        /// </summary>
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        public Benner.Tecnologia.Common.EntityAssociation Cliente
        {
            get
            {
                return Fields["CLIENTE"] as Benner.Tecnologia.Common.EntityAssociation;
            }
            set
            {
                if (value == null)
                {
                    this.Cliente.Handle = null;
                }
                else
                {
                    if (value.IsLoaded)
                    {
                        this.Cliente.Instance = value.Instance;
                    }
                    else
                    {
                        this.Cliente.Handle = value.Handle;
                    }
                }
            }
        }
        
        /// <summary>
        /// Data de Devolução (DATADEVOLUCAO.)
        /// Opcional = N, Invisível = False, Formato Data = Dia, Mês, Ano - Formato Hora = Sem hora
        /// </summary>
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        public System.Nullable<System.DateTime> DataDevolucao
        {
            get
            {
                return Fields["DATADEVOLUCAO"] as System.Nullable<System.DateTime>;
            }
            set
            {
                Fields["DATADEVOLUCAO"] = value;
            }
        }
        
        /// <summary>
        /// Data final (DATAFIM.)
        /// Opcional = N, Invisível = False, Formato Data = Dia, Mês, Ano - Formato Hora = Sem hora
        /// </summary>
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        public System.Nullable<System.DateTime> DataFinal
        {
            get
            {
                return Fields["DATAFIM"] as System.Nullable<System.DateTime>;
            }
            set
            {
                Fields["DATAFIM"] = value;
            }
        }
        
        /// <summary>
        /// Datainicio (DATAINICIO.)
        /// Opcional = N, Invisível = False, Formato Data = Dia, Mês, Ano - Formato Hora = Sem hora
        /// </summary>
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        public System.Nullable<System.DateTime> Datainicio
        {
            get
            {
                return Fields["DATAINICIO"] as System.Nullable<System.DateTime>;
            }
            set
            {
                Fields["DATAINICIO"] = value;
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        public Benner.Biblioteca.Entidades.ILivros LivroInstance
        {
            get
            {
                if (Livro.Handle == null)
                {
					return null;
                }
                return Livro.Instance;
            }
            set
            {
                if (value == null)
                {
					Livro = null;
					return;
                }
                Livro.Instance = (Benner.Biblioteca.Entidades.Livros) value;
            }
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        public Handle LivroHandle
        {
            get
            {
                return Livro.Handle;
            }
            set
            {
                Livro.Handle = value;
            }
        }
        
        /// <summary>
        /// Livro (LIVRO.)
        /// Opcional = N, Invisível = False, Pesquisar = LIVROS
        /// </summary>
        [System.CodeDom.Compiler.GeneratedCodeAttribute("BEF Code Generator", "17.2.0.0")]
        public Benner.Tecnologia.Common.EntityAssociation<Benner.Biblioteca.Entidades.Livros> Livro
        {
            get
            {
                return (Fields["LIVRO"] as EntityAssociation).Wrap<Benner.Biblioteca.Entidades.Livros>(Benner.Biblioteca.Entidades.Livros.Get);
            }
            set
            {
                if (value == null)
                {
                    this.Livro.Handle = null;
                }
                else
                {
                    if (value.Association.IsLoaded)
                    {
                        this.Livro.Instance = value.Instance;
                    }
                    else
                    {
                        this.Livro.Handle = value.Handle;
                    }
                }
            }
        }
    }
}
