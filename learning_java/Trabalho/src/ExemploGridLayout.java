import java.awt.GridLayout;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;


public class ExemploGridLayout {

		JFrame janela = new JFrame();
		JPanel painel = new JPanel();
		JLabel rotulo1 = new JLabel("Ecolha uma fruta: ");
		JLabel rotulo2 = new JLabel("Escolha uma bebida: ");
		DefaultListModel listModel = new DefaultListModel();
		JList lista = new JList(listModel);
		JComboBox combo = new JComboBox();
		JButton botao = new JButton("OK!");
		
		
		public static void main (String [] args){
			new ExemploGridLayout();
		}
		
		private ExemploGridLayout(){
			janela.setTitle("Exemplo G. L.");
			janela.setSize(300,200);
			janela.setLocation(50,50);
			janela.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			painel.setLayout(new GridLayout(3,2,5,1));
			painel.add(rotulo1);
			listModel.addElement("Maçã");
			listModel.addElement("Uva");
			listModel.addElement("Pera");
			painel.add(lista);
			painel.add(rotulo2);
			combo.addItem("Água");
			combo.addItem("Refrigerante");
			combo.addItem("Suco");
			painel.add(combo);
			painel.add(botao);
			janela.add(painel);
			
			janela.setVisible(true);
			
		}
}
