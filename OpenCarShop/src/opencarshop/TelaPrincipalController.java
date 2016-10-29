/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opencarshop;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.scene.text.Text;

/**
 *
 * @author lucas
 */
public class TelaPrincipalController implements Initializable {
    
    @FXML
    private StackPane acContent;   
    
    @FXML
    private Text tx_info; 
    
    @FXML
    private void cadastrarFuncionario(ActionEvent event) {
        System.out.println("Cadastrar Funcionario");
        tx_info.setText("Cadastrar Funcionario");
        FXMLLoader fxmlLoader = new FXMLLoader();
        try {
            fxmlLoader.load(getClass().getResource("/opencarshop/funcionario/view/Cadastrar.fxml").openStream());
        } catch (IOException e) {
            
        }
        AnchorPane root = fxmlLoader.getRoot();
        acContent.getChildren().clear();
        acContent.getChildren().add(root);
    }
    
    @FXML
    private void listarFuncionario(ActionEvent event) {
        System.out.println("Buscar Funcionario");
        tx_info.setText("Listar Funcionario");
        FXMLLoader fxmlLoader = new FXMLLoader();
        try {
            fxmlLoader.load(getClass().getResource("/opencarshop/funcionario/view/Buscar.fxml").openStream());
        } catch (IOException e) {
            
        }
        AnchorPane root = fxmlLoader.getRoot();
        acContent.getChildren().clear();
        acContent.getChildren().add(root);
    }
    
    @FXML
    private void cadastrarFornecedor(ActionEvent event) {
        System.out.println("Cadastrar Fornecedor");
        tx_info.setText("Cadastrar Fornecedor");
        FXMLLoader fxmlLoader = new FXMLLoader();
        try {
            fxmlLoader.load(getClass().getResource("/opencarshop/fornecedor/view/Cadastrar.fxml").openStream());
        } catch (IOException e) {
            
        }
        AnchorPane root = fxmlLoader.getRoot();
        acContent.getChildren().clear();
        acContent.getChildren().add(root);
    }
    
    @FXML
    private void listarFornecedor(ActionEvent event) {
        System.out.println("Buscar Fornecedor");
        tx_info.setText("Listar Fornecedor");
        FXMLLoader fxmlLoader = new FXMLLoader();
        try {
            fxmlLoader.load(getClass().getResource("/opencarshop/fornecedor/view/Buscar.fxml").openStream());
        } catch (IOException e) {
            
        }
        AnchorPane root = fxmlLoader.getRoot();
        acContent.getChildren().clear();
        acContent.getChildren().add(root);
    }
    
    @FXML
    private void cadastrarCliente(ActionEvent event) {
        System.out.println("Cadastrar Cliente");
        tx_info.setText("Cadastrar Cliente");
        FXMLLoader fxmlLoader = new FXMLLoader();
        try {
            fxmlLoader.load(getClass().getResource("/opencarshop/cliente/view/Cadastrar.fxml").openStream());
        } catch (IOException e) {
            
        }
        AnchorPane root = fxmlLoader.getRoot();
        acContent.getChildren().clear();
        acContent.getChildren().add(root);
    }
    
    @FXML
    private void listarCliente(ActionEvent event) {
        System.out.println("Buscar Cliente");
        tx_info.setText("Listar Cliente");
        FXMLLoader fxmlLoader = new FXMLLoader();
        try {
            fxmlLoader.load(getClass().getResource("/opencarshop/cliente/view/Buscar.fxml").openStream());
        } catch (IOException e) {
            
        }
        AnchorPane root = fxmlLoader.getRoot();
        acContent.getChildren().clear();
        acContent.getChildren().add(root);
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    
}
