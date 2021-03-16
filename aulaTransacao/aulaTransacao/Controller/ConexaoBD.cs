using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using aulaTransacao.Model;
using MySql.Data.MySqlClient;

namespace aulaTransacao.Controller
{
    public class ConexaoBD
    {
        public MySqlConnection conexao = new MySqlConnection(); // variavel de conexão com o bd

        DadosConexao dadosConexao = null; // variavel de dados da conexao

        public ConexaoBD(DadosConexao dadosConexao)
        {
            this.dadosConexao = dadosConexao;
        }

        // conectar no bd
        public bool conectar()
        {
            if(dadosConexao != null)
            {
                try
                {
                    // testar se a conexao está ativa
                    if (conexao.State == System.Data.ConnectionState.Open)
                        desconectar();

                    string sql = "Server=" + dadosConexao.host.Trim() + ";" + "Database=" + dadosConexao.dataBase.Trim() +";" + "Uid=" + dadosConexao.user.Trim() +";" + "Pwd=" + dadosConexao.password.Trim() +";" + "Connection Timeout=900;" + "Port=" + dadosConexao.port.ToString();

                    conexao = new MySqlConnection(sql);
                    conexao.Open();
                    return true;
                } 
                catch(Exception ex)
                {
                    MessageBox.Show("Erro ao conectar com o banco de dados: " + ex.ToString(), "Aplicação", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
            }
            else
            {
                MessageBox.Show("Nenhum dado de conexão encontrado. Verifique!", "Aplicação", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }



        // desconectar do bd
        public bool desconectar()
        {
            try
            {
                // testar se a conexao está ativa
                if (conexao.State == System.Data.ConnectionState.Open)
                    conexao.Close();
                    return true;
            } catch(Exception ex)
            {
                MessageBox.Show("Erro ao desconectar com o banco de dados: " + ex.ToString(), "Aplicação", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;                
            }
        }


    }
}
