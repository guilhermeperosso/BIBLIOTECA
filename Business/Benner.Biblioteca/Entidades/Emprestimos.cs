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
        protected override void Saving()
        {
            var livroDao = LivrosDao.CreateInstance();
            var livro = livroDao.Get(LivroHandle);
            if (livro.Emprestado == true)
            {
                throw new BusinessException("Este livro já está emprestado.");
            }
            else
            {
                livro.Emprestado = true;
                livroDao.Save(livro);
            }
            base.Saving();
        }

        public void Devolver(BusinessArgs args)
        {
            var emprestimoDao = EmprestimosDao.CreateInstance();
            var emprestimo = emprestimoDao.Get(Handle);
            var livroDao = LivrosDao.CreateInstance();
            var livro = livroDao.Get(LivroHandle);
            if (livro.Emprestado == true)
            {
                emprestimo.DataDevolucao = DateTime.Now.Date;
                livro.Emprestado = false;
                livroDao.Save(livro);
                emprestimoDao.Save(emprestimo);
            }
            else
            {
                throw new BusinessException("Este livro já foi devolvido.");
            }


           
        }
    }
}
