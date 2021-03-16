using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using aulaTransacao.Controller;
using aulaTransacao.Model;
using MySql.Data.MySqlClient;

namespace aulaTransacao
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DadosConexao dadosConexao = new DadosConexao("localhost", "root", "", "escola", 3306);

            ConexaoBD conexaoBD = new ConexaoBD(dadosConexao);
            try
            {
                if (conexaoBD.conectar())
                {
                    MessageBox.Show("Conectou!", "Aplicação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    conexaoBD.desconectar();
                } else
                    {
                        MessageBox.Show("Não conectou!", "Aplicação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
            } catch(Exception ex)
            {
                MessageBox.Show("Erro na conexão com o banco de dados: " + ex.ToString(), "Aplicação", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DadosConexao dadosConexao = new DadosConexao("localhost", "root", "", "escola", 3306);

            ConexaoBD conexaoBD = new ConexaoBD(dadosConexao);
            comboBox1.Items.Clear();
            try
            {
                if (conexaoBD.conectar())
                {
                    string sql = "select * from pessoa order by nome";
                    MySqlCommand comando = new MySqlCommand(sql, conexaoBD.conexao);
                    MySqlDataReader dr = comando.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            comboBox1.Items.Add(dr["nome"].ToString());
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Não conectou!", "Aplicação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao buscar pessoas no banco de dados: " + ex.ToString(), "Aplicação", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
