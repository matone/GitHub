package main.controller;

import java.util.Optional;
import java.util.ResourceBundle;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ButtonBar.ButtonData;
import javafx.scene.layout.GridPane;
import main.MainApp;
import main.model.Funeral;
import main.model.people.Applicant;
import main.model.people.Deceased;
import main.model.people.Owner;
import main.model.places.Grave;
import main.util.HibernateUtil;

public class FuneralRegistrationController {
	
	@FXML
	private GridPane gridPane;
	@FXML
	private Label funeralInformationLabel;
	@FXML
	private Label funeralRegistrationLabel;
	@FXML
	private Label personalInfoLabel;
	@FXML
	private Label deceasedInfoLabel;
	@FXML
	private Label firstNameLabel;
	@FXML
	private Label lastNameLabel;
	@FXML
	private Label cityLabel;
	@FXML
	private Label streetLabel;
	@FXML
	private Label postalCodeLabel;
	@FXML
	private Label phoneNumberLabel;
	@FXML
	private Label emailLabel;
	@FXML
	private Label decFirstNameLabel;
	@FXML
	private Label decLastNameLabel;
	@FXML
	private Label graveNumberLabel;
	@FXML
	private Label funeralDateLabel;
	@FXML
	private Label sectorNumberLabel;
	@FXML
	private Label graveLabel;
	@FXML
	private Label funeralTimeLabel;
	@FXML
	private Label ageLabel;
	@FXML
	private Label timeLabel;
	@FXML
	private TextField firstNameTextField;
	@FXML
	private TextField lastNameTextField;
	@FXML
	private TextField cityTextField;
	@FXML
	private TextField streetTextField;
	@FXML
	private TextField postalCodeTextField;
	@FXML
	private TextField phoneNumberTextField;
	@FXML
	private TextField emailTextField;
	@FXML
	private TextField decFirstNameTextField;
	@FXML
	private TextField decLastNameTextField;
	@FXML
	private TextField graveNumberTextField;
	@FXML
	private TextField sectorNumberTextField;
	@FXML
	private TextField ageTextField;
	@FXML
	private TextField daysTextField;
	@FXML
	private TextField monthsTextField;
	@FXML
	private TextField yearsTextField;
	@FXML
	private ComboBox<String> timeBox;
	@FXML
	private Button cancelButton;
	@FXML
	private Button okButton;
	@FXML
	private Button checkButton;
	
	private MainApp mainApp;
	private boolean initialized = false;
	private boolean accesAvailable = false;
	private int years;
	private int months;
	private int days;
	private int hours;
	private Grave grave;
	
	public FuneralRegistrationController(MainApp mainApp) {
		this.mainApp = mainApp;
	}
	
	public void resetText(){
		ResourceBundle resourceBundle = mainApp.getResourceBundle();
		funeralRegistrationLabel.setText(resourceBundle.getString("funeralRegistrationLabel"));
		personalInfoLabel.setText(resourceBundle.getString("personalInfoLabel"));
		deceasedInfoLabel.setText(resourceBundle.getString("deceasedInfoLabel"));
		firstNameLabel.setText(resourceBundle.getString("firstNameLabel"));
		lastNameLabel.setText(resourceBundle.getString("lastNameLabel"));
		cityLabel.setText(resourceBundle.getString("cityLabel"));
		streetLabel.setText(resourceBundle.getString("streetLabel"));
		postalCodeLabel.setText(resourceBundle.getString("postalCodeLabel"));
		phoneNumberLabel.setText(resourceBundle.getString("phoneNumberLabel"));
		emailLabel.setText(resourceBundle.getString("emailLabel"));
		decFirstNameLabel.setText(resourceBundle.getString("firstNameLabel"));
		decLastNameLabel.setText(resourceBundle.getString("lastNameLabel"));
		graveNumberLabel.setText(resourceBundle.getString("graveNumberLabel"));
		sectorNumberLabel.setText(resourceBundle.getString("sectorNumberLabel"));
		funeralDateLabel.setText(resourceBundle.getString("funeralDateLabel"));
		okButton.setText(resourceBundle.getString("okButton"));
		cancelButton.setText(resourceBundle.getString("cancelButton"));
		funeralInformationLabel.setText(resourceBundle.getString("funeralInformationLabel"));
		graveLabel.setText(resourceBundle.getString("graveLabel"));
		ageLabel.setText(resourceBundle.getString("age"));
		timeLabel.setText(resourceBundle.getString("time"));
	
	}

	@FXML
	private void initialize(){
		timeBox.getItems().addAll("08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00");
		resetText();
		setInitialized(true);
	}
	
	@FXML
	private void handleCancelButton(){
		mainApp.showIntroductionPane();
	}
	
	@FXML
	private void handleOkButton(){
		if (isInputValid()){
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			Transaction t = session.beginTransaction();
			Object temp = session.createSQLQuery(
					"SELECT o.id FROM owner o "+
							"JOIN rent r ON o.id = r.owner_id "+
							"JOIN grave g ON r.grave_id = g.id "+ 
							"WHERE first_name = '"+ firstNameTextField.getText()+
							"' AND last_name = '"+ lastNameTextField.getText()+ 
							"' AND city = '" + cityTextField.getText()+ 
							"' AND street = '" + streetTextField.getText()+ 
							"' AND postal_code = '"+ postalCodeTextField.getText()+ 
							"' AND email = '" + emailTextField.getText()+ 
							"' AND phone_number = '" + phoneNumberTextField.getText()+ 
							"' AND grave_number = " + graveNumberTextField.getText()+
							" AND sector_id = " + grave.getSector().getId()).uniqueResult();
			if  (temp == null) {
				System.out.println("hm");
				Alert alert = new Alert(AlertType.CONFIRMATION);
				alert.setTitle("Authorization Problem");
				alert.setHeaderText("Applicant is not owner of the grave number " + graveNumberTextField.getText()
						+ " in sector " + sectorNumberTextField.getText());
				alert.setContentText("Does applicant have permission for the action ?");
				ButtonType typeYes = new ButtonType("Yes", ButtonData.OK_DONE);
				ButtonType typeNo = new ButtonType("No", ButtonData.CANCEL_CLOSE);
				alert.getButtonTypes().setAll(typeNo, typeYes);
				Optional<ButtonType> result = alert.showAndWait();
				if (result.get() == typeNo) {
					return;
				}
			}

			Applicant applicant = (Applicant)session.createSQLQuery("SELECT * FROM applicant a "+ 
					"WHERE a.first_name = '"+ firstNameTextField.getText()+
					"' AND a.last_name = '"+ lastNameTextField.getText()+ 
					"' AND a.city = '" + cityTextField.getText()+ 
					"' AND a.street = '" + streetTextField.getText()+ 
					"' AND a.postal_code = '"+ postalCodeTextField.getText()+ 
					"' AND a.email = '" + emailTextField.getText()+ 
					"' AND a.phone_number = '" + phoneNumberTextField.getText()+"'").addEntity(Applicant.class).uniqueResult();
			
			Deceased deceased = (Deceased)session.createSQLQuery("SELECT * FROM deceased d "+ 
					"WHERE d.first_name = '"+ decFirstNameTextField.getText()+
					"' AND d.last_name = '"+ decLastNameTextField.getText()+
					"' AND d.age = " + Integer.parseInt(ageTextField.getText())).addEntity(Deceased.class).uniqueResult();
			
			if (applicant==null){
				applicant = new Applicant();
				applicant.setFirstName(firstNameTextField.getText());
				applicant.setLastName(lastNameTextField.getText());
				applicant.setCity(cityTextField.getText());
				applicant.setStreet(streetTextField.getText());
				applicant.setEmail(emailTextField.getText());
				applicant.setPhoneNumber(phoneNumberTextField.getText());
				applicant.setPostalCode(postalCodeTextField.getText());
				session.persist(applicant);
			}
			if (deceased==null){
				deceased = new Deceased();
				deceased.setFirstName(decFirstNameTextField.getText());
				deceased.setLastName(decLastNameTextField.getText());
				deceased.setAge(Integer.parseInt(ageTextField.getText()));
				session.persist(deceased);
			}
			
			Funeral funeral = new Funeral(deceased, grave, applicant);
			funeral.setIntDateFrom(years, months, days, hours, 0);
			session.persist(funeral);
			session.createSQLQuery("UPDATE grave SET full_places_number = "+(grave.getFullPlacesNumber()+1)+" WHERE id = "+grave.getId()).executeUpdate();
			
			t.commit();
			session.close();
			
			Alert alert = new Alert(AlertType.INFORMATION);
			alert.initOwner(mainApp.getPrimaryStage());
			alert.setTitle("New Funeral");
			alert.setHeaderText("New funeral was successfully created.");
			alert.showAndWait();
			mainApp.showFuneralRegistrationPane();
		} else{
            Alert alert = new Alert(AlertType.ERROR);
            alert.initOwner(mainApp.getPrimaryStage());
            alert.setTitle("Invalid Fields");
            alert.setHeaderText("Please fill out all red fields.");
            alert.setContentText(null);
            alert.showAndWait();
		}
	}
	
	@FXML
	private void handleChceckButton() throws NumberFormatException{
		String message = null;
		if ((graveNumberTextField.getText().isEmpty())||(sectorNumberTextField.getText().isEmpty())){
			message = "You have to enter the grave and sector numbers";
		} else{
			try {
				int sectorNumber = Integer.parseInt(sectorNumberTextField.getText());
				int graveNumber = Integer.parseInt(graveNumberTextField.getText());
				SessionFactory sf = HibernateUtil.getSessionFactory();
				Session session = sf.openSession();
				grave = (Grave) session.createSQLQuery("SELECT g.id, grave_number, sector_id, all_places_number, full_places_number "
													+ "FROM grave g JOIN sector s ON g.sector_id = s.id "
													+ "WHERE g.grave_number = "+ graveNumberTextField.getText()+
													"AND  s.sector_number = "+sectorNumberTextField.getText()).addEntity(Grave.class).uniqueResult();				
				if (grave==null){
					message = "Grave Does Not Exist";
				} else{
					if (grave.getAllPlacesNumber()==grave.getFullPlacesNumber()){
						message = "Grave is Full";
					} else if (session.createSQLQuery("SELECT o.id, o.first_name, o.last_name, o.city, o.street, o.postal_code, o.email, o.phone_number FROM owner o " +
							"JOIN rent r ON o.id = r.owner_id " +
							"JOIN grave g ON r.grave_id = g.id " +
							"JOIN sector s ON g.sector_id = s.id " +
							"WHERE s.sector_number = " + sectorNumber +
							" AND g.grave_number = " + graveNumber+
							" AND r.date_to IS NULL").addEntity(Owner.class).uniqueResult()==null){
						message = "Grave Does Not Have Owner";
					} else{
						setAccesAvailable(true);
						graveNumberTextField.setStyle("-fx-border-color: #00FF00;-fx-border-width: 2");
						sectorNumberTextField.setStyle("-fx-border-color: #00FF00;-fx-border-width: 2");
					}
				}
				session.close();
			} catch (NumberFormatException e) {
				message = "Grave and sector numbers must be numerical";
				e.printStackTrace();
			}	
		}

		if (!isAccesAvailable()){
			graveNumberTextField.setStyle("-fx-border-color: #FF3333;-fx-border-width: 2");
			sectorNumberTextField.setStyle("-fx-border-color: #FF3333;-fx-border-width: 2");
			Alert alert = new Alert(AlertType.ERROR);
			alert.initOwner(mainApp.getPrimaryStage());
			alert.setTitle("Invalid Fields");
			alert.setHeaderText(message);
			alert.setContentText(null);
			alert.showAndWait();				
		}
	}
	
	public boolean isInputValid() throws NumberFormatException {
		boolean temp=true;
		
		TextField tempTextField;
		ObservableList<Object> column = FXCollections.observableArrayList();
		column.addAll(gridPane.getChildren());
		if (!isDateValid()){
			yearsTextField.setStyle("-fx-border-color: #FF3333;-fx-border-width: 2");
			monthsTextField.setStyle("-fx-border-color: #FF3333;-fx-border-width: 2");
			daysTextField.setStyle("-fx-border-color: #FF3333;-fx-border-width: 2");
			temp = false;
		} else{
			yearsTextField.setStyle("");
			monthsTextField.setStyle("");
			daysTextField.setStyle("");
		}
		for (Object object : column) {
			if (object.getClass().equals(TextField.class)){
				tempTextField = (TextField) object;
				if (tempTextField.getText().isEmpty()){
					temp=false;
					tempTextField.setStyle("-fx-border-color: #FF3333;-fx-border-width: 2");
				} else{
					tempTextField.setStyle("");
				}
			}
		}
		if (temp && !isAccesAvailable()){
			handleChceckButton();
		}
		if (temp){
			try{
				Integer.parseInt(ageTextField.getText());
			} catch (NumberFormatException e){
				ageTextField.setStyle("-fx-border-color: #FF3333;-fx-border-width: 2");
				e.printStackTrace();
				temp = false;
			}
		}
		return temp;
	}
	
	public boolean isDateValid() throws NumberFormatException{
		String temp="Date values must be numerical";
		try {
			years = Integer.parseInt(yearsTextField.getText());
			months = Integer.parseInt(monthsTextField.getText());
			days = Integer.parseInt(daysTextField.getText());
			System.out.println(timeBox.getSelectionModel().getSelectedIndex() + 8);
			hours = timeBox.getSelectionModel().getSelectedIndex() + 8;
			temp="Please enter the date in dd/mm/yyyy format";
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
		}
		
		if ((days<=31)&&(months<=12)&&(days>0)&&(months>0)){
			return true;
		}
		Alert alert = new Alert(AlertType.ERROR);
		alert.initOwner(mainApp.getPrimaryStage());
		alert.setTitle("Invalid Date Format");
		alert.setHeaderText(temp);
		alert.setContentText(null);
		alert.showAndWait();
		return false;
	}
	
	public boolean isInitialized() {
		return initialized;
	}

	public void setInitialized(boolean initialized) {
		this.initialized = initialized;
	}

	public boolean isAccesAvailable() {
		return accesAvailable;
	}

	public void setAccesAvailable(boolean accesAvailable) {
		this.accesAvailable = accesAvailable;
	}
}