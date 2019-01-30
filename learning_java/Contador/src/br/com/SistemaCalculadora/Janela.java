package br.com.SistemaCalculadora;

import javax.swing.*;

import java.awt.Container;
import java.awt.event.*;



public class Janela extends JFrame implements ActionListener  {
	
		//Atributos
		private Container contentor;
		private JPanel painel;
		private JLabel texto;
		private int cont;
		private JButton botao;
		
		
		//Construtor
		public Janela(){
			
			super("Super Software Contador de Cliques");
			super.setSize(800, 600);
			
			cont =0;
			botao = new JButton("Clique aqui!");
			painel = new JPanel();
			contentor = new Container();
			texto  = new JLabel("");
			
			painel.setLayout(new BoxLayout(painel,BoxLayout.Y_AXIS));
			botao.setSize(100, 100);
			botao.setLocation(150, 200);
			botao.addActionListener(this);
			contentor.setLayout(null);
			
			getContentPane().add(painel);
			getContentPane().add(botao);
			getContentPane().add(texto);
		}
		
		public void actionPerformed(ActionEvent e) {
			cont++;
		texto.setText("Números de cliques: "+cont);	
		}
			
		}

