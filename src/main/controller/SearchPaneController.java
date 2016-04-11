package main.controller;

import java.util.List;
import java.util.ResourceBundle;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import main.MainApp;
import main.model.people.Deceased;
import main.model.people.Person;
import main.util.HibernateUtil;

public class SearchPaneController {
	@FXML
	private Label searchLabel;
	@FXML
	private TextField searchTextField;
	@FXML
	private Button findButton;
	@FXML
	private ComboBox<String> classBox;
	@FXML
	private ComboBox<String>attributeBox;
	@FXML
	private TextArea textArea;
	
	private MainApp mainApp;
	private ResourceBundle resourceBundle;
	
	public SearchPaneController(MainApp mainApp) {
		setMainApp(mainApp);
		setResourceBundle(mainApp.getResourceBundle());
	}
	
	@FXML
	private void initialize(){
		resetText();
	}
	

	public void resetText(){
		findButton.setText(resourceBundle.getString("find"));
		searchLabel.setText(resourceBundle.getString("searchButton"));
		ObservableList<String> list = FXCollections.observableArrayList("Owner","Applicant","Manager","Deceased");
		classBox.setItems(list);
	}
	
	@SuppressWarnings("unchecked")
	@FXML
	private void handleFindButton(){
		textArea.clear();
		String pattern = "";
		Alert alert;
		if (!searchTextField.getText().isEmpty()){			
			pattern =  " WHERE first_name = '"+searchTextField.getText()+"' OR last_name = '"+searchTextField.getText()+"'";
		}
		
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		List<Object> list = null;
		
		try {
			list = session.createSQLQuery("SELECT * FROM "+classBox.getSelectionModel().getSelectedItem()+pattern).addEntity(Class.forName("main.model.people."+classBox.getSelectionModel().getSelectedItem())).list();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		session.close();
		
		if (!list.isEmpty()){
			showResult(list);
		} else{
			alert = new Alert(AlertType.ERROR);
			alert.initOwner(mainApp.getPrimaryStage());
			alert.setTitle("No Match");
			alert.setHeaderText("There is no person with name '"+pattern+"'");
			alert.setContentText(null);
			alert.showAndWait();
		}
	}
	
	public void showResult(List<Object> people){
		int i = 0;
		if (people.get(0).getClass()==Deceased.class){
			Deceased deceased;
			for (Object object : people) {
				i++;
				deceased = (Deceased) object;
				textArea.setText(textArea.getText()+"Result "+i+"\nFirst Name: "+deceased.getFirstName()+"\nLast Name: "+deceased.getLastName()+"\nAge: "+deceased.getAge()+"\n \n \n");
			}
		} else{
			Person person;
			for (Object object : people) {
				i++;
				person = (Person) object;
				textArea.setText(textArea.getText()+"Result "+i+":\nFirst Name: "+person.getFirstName()+"\nLast Name: "+person.getLastName()+"\nCity: "+person.getCity()+
									"\nStreet: "+person.getStreet()+"\nPostal Code: "+person.getPostalCode()+"\nPhone Number: "+person.getPhoneNumber()+"\nEmail: "+person.getEmail()+"\n \n");		
			}
		}
	}
	
	public MainApp getMainApp() {
		return mainApp;
	}

	public void setMainApp(MainApp mainApp) {
		this.mainApp = mainApp;
	}

	public ResourceBundle getResourceBundle() {
		return resourceBundle;
	}

	public void setResourceBundle(ResourceBundle resourceBundle) {
		this.resourceBundle = resourceBundle;
	}
}
