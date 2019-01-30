import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;



public class ExemploFlowLayout implements ActionListener{
	JFrame janela = new JFrame();
	JPanel painel = new JPanel();
	JLabel rotulo = new JLabel("Seu nome: ");
	JTextField texto = new JTextField(5);
	JButton botao = new JButton("Ok!");
	
	public static void main (String[]args){
		new ExemploFlowLayout();
	}
	
	private ExemploFlowLayout(){
		janela.setTitle("JAVA Swing");
		janela.setSize(200,130);
		janela.setLocation(50,50);
		janela.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		painel.setLayout(new FlowLayout(FlowLayout.CENTER, 30, 20));
		painel.add(rotulo);
		painel.add(texto);
		painel.add(botao);
		janela.add(painel);
		janela.setVisible(true);
		botao.addActionListener(this);
		
		
	}
	
	public void actionPerformed(ActionEvent e){
		if (e.getSource()==botao) {
			JOptionPane.showMessageDialog(null,texto.getText());
		}
	}


	

}
