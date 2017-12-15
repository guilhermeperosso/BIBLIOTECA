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
    /// Nome da Tabela: EMPRESTIMOS.
    /// Essa é uma classe parcial, os atributos, herança e propriedades estão definidos no arquivo Emprestimos.properties.cs
    /// </summary>
    public partial class Emprestimos
    {
        private readonly ILivrosDao _livroDao = LivrosDao.CreateInstance();
        private readonly IEmprestimosDao _emprestimoDao = EmprestimosDao.CreateInstance();
        private readonly IClientesDao _clienteDao = ClientesDao.CreateInstance();
        private readonly ILivrosclienteDao _livroClienteDao = LivrosclienteDao.CreateInstance();

        protected override void Validating()
        {
            var cliente = _clienteDao.Get(ClienteHandle);
            var livro = _livroDao.Get(LivroHandle);
            
            if (DataDevolucao == null)
            {
                var dias = DataFinal.Value <= DataInicio.Value;
                if (livro.Emprestado == true && dias)
                {
                    throw new BusinessException("Não foi possível efetuar o empréstimo.");
                }
                else
                {
                    livro.Emprestado = true;
                    livro.NumeroEmprestimos++;
                    _livroDao.Save(livro);
                }
            }
            else
            {
                livro.Emprestado = false;
            }
            base.Validating();
        }

        protected override void Saved()
        {
            var cliente = _clienteDao.Get(ClienteHandle);
            var livro = _livroDao.Get(LivroHandle);
            var livroCliente = _livroClienteDao.Create();

            livroCliente.VinculaLivroCliente(cliente, livro);
            base.Saved();
        }

        protected override void Editing()
        {
            var livro = _livroDao.Get(LivroHandle);
            livro.Emprestado = livro.Emprestado;
            _livroDao.Save(livro);
            base.Editing();
        }

        public void Devolver(BusinessArgs args)
        {
            var emprestimo = _emprestimoDao.Get(Handle);
            var livro = _livroDao.Get(LivroHandle);
            if (DataDevolucao == null)
            {
                    livro.Emprestado = false;
                    _livroDao.Save(livro);
                    emprestimo.DataDevolucao = DateTime.Now.Date;
                    _emprestimoDao.Save(emprestimo);
            }
            else
            {
                throw new BusinessException("Este livro já foi devolvido.");
            }
        }
    }
}
