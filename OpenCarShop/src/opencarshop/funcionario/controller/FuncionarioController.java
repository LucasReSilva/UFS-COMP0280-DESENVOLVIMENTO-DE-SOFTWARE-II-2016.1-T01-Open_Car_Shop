/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opencarshop.funcionario.controller;

import java.io.IOException;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import opencarshop.funcionario.model.Contrato;
import opencarshop.funcionario.model.Funcionario;
import opencarshop.funcionario.model.FuncionarioDAO;
import opencarshop.Endereco;
import opencarshop.util.Utilidades;

/**
 * FXML Controller class
 *
 * @author lucas
 */
public class FuncionarioController implements Initializable {

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }
    
    // TELA DE AUTENTICACAO
    @FXML
    private Label labelErro;
    @FXML
    private TextField tf_cpf;
    @FXML
    private PasswordField pf_senha;
    @FXML
    private Hyperlink cadastroLink;
    
    // TELA DE CADASTRO
    @FXML
    private TextField tf_cpfCadastro;
    @FXML
    private PasswordField pf_senhaCadastro;
    @FXML
    private TextField tf_nomeCadastro;
    @FXML
    private DatePicker dp_dataNascimentoCadastro;
    
    @FXML
    private TextField tf_emailCadastro;
    @FXML
    private TextField tf_telefone1Cadastro;   
    @FXML
    private TextField tf_telefone2Cadastro;
    @FXML
    private TextField tf_ruaCadastro;
    @FXML
    private TextField tf_cidadeCadastro;
    @FXML
    private TextField tf_estadoCadastro;
    @FXML
    private TextField tf_bairroCadastro;
    @FXML
    private TextField tf_cepCadastro;
    @FXML
    private TextField tf_numeroCadastro;
    @FXML
    private TextField tf_complementoCadastro;
    
    @FXML
    private TextField tf_salarioCadastro;
    @FXML
    private TextField tf_cargoCadastro;
    @FXML
    private DatePicker dp_dataInicioCadastro;
    @FXML
    private DatePicker dp_dataTerminoCadastro;
    
    
    @FXML
    private void autenticar(ActionEvent event) 
    {
        Funcionario funcionario;
        FuncionarioDAO func = new FuncionarioDAO();
        funcionario = func.getFuncionario(tf_cpf.getText());
        
        if(funcionario != null)
        {
            if(funcionario.getSenha().equals(pf_senha.getText()))
            {
                Parent root = null;
                try 
                {
                    root = FXMLLoader.load(getClass().getResource("/opencarshop/TelaPrincipal.fxml"));
                    Scene scene = new Scene(root);
                    Stage nStage = new Stage();
                    nStage.setScene(scene);
                    //nStage.setMaximized(true);
                    nStage.setMaxHeight(768);
                    nStage.setMaxWidth(1024);
                    nStage.setTitle("OpenCarShop");
                    nStage.setResizable(false);
                    nStage.show();
                    Stage stage = (Stage) cadastroLink.getScene().getWindow();
                    stage.close();
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
            else
            {
                labelErro.setText("Login ou senha errado!!!");
            }
        }
        else
        {
            labelErro.setText("Login ou senha errado!!!");
        }
    }
    
    @FXML
    private void cadastrar(ActionEvent event) throws ParseException {
        Funcionario  func    = new Funcionario();
        Endereco     end     = new Endereco();
        Contrato     contr   = new Contrato();
        FuncionarioDAO f     = new FuncionarioDAO();
        Utilidades u = new Utilidades();
      
        // OBJETO FUNCIONARIO
        func.setCpf(tf_cpfCadastro.getText());
        func.setNome(tf_nomeCadastro.getText());
        func.setSenha(pf_senhaCadastro.getText());
        func.setDataNascimento(dp_dataNascimentoCadastro.getValue());
        func.setDataNascimento(dp_dataNascimentoCadastro.getValue());
        func.setEmail(tf_emailCadastro.getText());
        func.setTelefone1(tf_telefone1Cadastro.getText());
        func.setTelefone2(tf_telefone2Cadastro.getText());

        // OBJETO ENDERECO
        end.setCEP(tf_cepCadastro.getText());
        end.setEstado(tf_estadoCadastro.getText());
        end.setCidade(tf_cidadeCadastro.getText());
        end.setBairro(tf_bairroCadastro.getText());
        end.setRua(tf_ruaCadastro.getText());
        end.setNumero(Integer.parseInt(tf_numeroCadastro.getText()));
        end.setComplemento(tf_complementoCadastro.getText());

        // OBJETO CONTRATO
        contr.setCargo(tf_cargoCadastro.getText().charAt(0));
        contr.setSalario(DecimalFormat.getInstance().parse(tf_salarioCadastro.getText()).doubleValue());
        contr.setDataInicio(dp_dataInicioCadastro.getValue());
        contr.setDataTermino(dp_dataTerminoCadastro.getValue());
	
        
        f.cadastraFuncionario(func, end, contr);   
    }
    
    @FXML
    private void buscar(ActionEvent event) {
        System.out.println("Filtrando Busca");
    }
    
}
