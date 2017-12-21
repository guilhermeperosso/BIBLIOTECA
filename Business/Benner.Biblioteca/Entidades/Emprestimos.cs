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
            if (!IsEditing && DataFinal.Value < DataInicio.Value)
            {
                throw new BusinessException("Data final inválida.");
            }
            if (!IsEditing && DataDevolucao == null)
            {
                if (livro.Emprestado == true)
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
            base.Validating();
        }

        protected override void Saved()
        {
            var cliente = _clienteDao.Get(ClienteHandle);
            var livro = _livroDao.Get(LivroHandle);
            if (DataDevolucao == null)
            {
                var livroCliente = _livroClienteDao.Create();
                livroCliente.VinculaLivroCliente(cliente, livro);
            }
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
            var livro = _livroDao.Get(LivroHandle);
            if (DataDevolucao == null)
            {
                if (DataFinal.Value < DateTime.Today)
                {
                    PagarMulta();
                }
                    DataDevolucao = DateTime.Today;
                    livro.Emprestado = false;
                    _livroDao.Save(livro);
                    Save();
            }
            else
            {
                throw new BusinessException("Este livro já foi devolvido.");
            }

        }

        public void PagarMulta()
        {
            Atrasado = DataFinal.Value < DateTime.Today;
            if (Atrasado == true)
            {
                decimal diasAtraso = (DateTime.Today - DataFinal.Value).Days;
                Multa = diasAtraso * (decimal)0.75;
                Atrasado = false;
                Save();
            }
        }

        protected override void Deleting()
        {
            if (DataDevolucao == null)
            {
                throw new BusinessException("Não é possível excluir um emprestimo ativo");
            }
            base.Deleting();
        }

        protected override void Created()
        {
            DataInicio = BennerEnvironment.ServerDate;
            base.Created();
        }
    }
}
