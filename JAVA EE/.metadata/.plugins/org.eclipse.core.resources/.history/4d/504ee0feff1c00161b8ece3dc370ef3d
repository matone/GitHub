package main.controller;

import javafx.scene.control.TextField;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;
import main.MainApp;
import model.places.Grave;
import model.places.Sector;


public class SchemeOverviewDialogController {
	
	@FXML
	private Button okButton;
	@FXML
	private Button cancelButton;
	@FXML
	private Label titleLabel;
	@FXML
	private Label numberLabel;
	@FXML
	private Label headerLabel;
	@FXML
	private Label allPlacesNumberLabel;
	@FXML
	private Label fullPlacesNumberLabel;
	@FXML
	private TextField numberTextField;
	@FXML
	private TextField headerTextField;
	@FXML
	private TextField allPlacesNumberTextField;
	@FXML
	private TextField fullPlacesNumberTextField;
	
	private MainApp mainApp;
	private Stage dialogStage;
	private Object object;
	private boolean graveClass;
	private boolean okClicked = false;
	private boolean change;
	
	public void setDialogStage(Stage dialogStage){
		this.dialogStage = dialogStage;
	}
		
	public SchemeOverviewDialogController(MainApp mainApp) {
		setMainApp(mainApp);
	}
	
	@FXML
	private void initialize(){
		headerTextField.setEditable(true);
		headerTextField.setDisable(false);
		if (change){
			if (graveClass){
				headerTextField.setEditable(false);
				headerTextField.setDisable(true);
				Grave grave = (Grave)object;
				numberTextField.setText(Integer.toString(grave.getGraveNumber()));
				headerTextField.setText(Integer.toString(grave.getSector().getSectorNumber()));
				allPlacesNumberTextField.setText(Integer.toString(grave.getAllPlacesNumber()));
				fullPlacesNumberTextField.setText(Integer.toString(grave.getFullPlacesNumber()));
			} else{
				Sector sector = (Sector)object;
				numberTextField.setText(Integer.toString(sector.getSectorNumber()));
				headerTextField.setText(Integer.toString(sector.getSize()));
				allPlacesNumberTextField.setText(Integer.toString(sector.getAllGravesNumber()));
				fullPlacesNumberTextField.setText(Integer.toString(sector.getFullGravesNumber()));
			}
		}
		resetText();
	}
	
	public void resetText(){
		ResourceBundle resourceBundle = mainApp.getResourceBundle();
		okButton.setText(resourceBundle.getString("okButton"));
		cancelButton.setText(resourceBundle.getString("cancelButton"));
		if (graveClass){
			if (change) {
				titleLabel.setText(resourceBundle.getString("graveChangeTitle"));
			} else{
				titleLabel.setText(resourceBundle.getString("graveNewTitle"));
			}
			numberLabel.setText(resourceBundle.getString("number"));
			headerLabel.setText(resourceBundle.getString("graveHeader"));
			allPlacesNumberLabel.setText(resourceBundle.getString("allPlacesNumberLabel"));
			fullPlacesNumberLabel.setText(resourceBundle.getString("fullPlacesNumberLabel"));
		} else{
			if (change) {
				titleLabel.setText(resourceBundle.getString("sectorChangeTitle"));
			} else{
				titleLabel.setText(resourceBundle.getString("sectorNewTitle"));
			}
			numberLabel.setText(resourceBundle.getString("number"));
			headerLabel.setText(resourceBundle.getString("sectorHeader"));
			allPlacesNumberLabel.setText(resourceBundle.getString("allPlacesNumberLabel"));
			fullPlacesNumberLabel.setText(resourceBundle.getString("fullPlacesNumberLabel"));
		}
	}
	
	@FXML
    private void handleCancelButton() {
        dialogStage.close();
    }
	
	@FXML
	private void handleOkButton(){
		if (isInputValid()){
			if (graveClass){
				Grave grave = (Grave)object;
				grave.setGraveNumber(Integer.parseInt(numberTextField.getText()));
				grave.setAllPlacesNumber(Integer.parseInt(allPlacesNumberTextField.getText()));
				if (!change){
					grave.setSector(new Sector(Integer.parseInt(headerTextField.getText())));
				}
			} else{
				Sector sector = (Sector)object;
				sector.setSectorNumber(Integer.parseInt(numberTextField.getText()));
				sector.setSize(Integer.parseInt(headerTextField.getText()));
				sector.setAllGravesNumber(Integer.parseInt(allPlacesNumberTextField.getText()));
			}
		}
		setOkClicked(true);
		dialogStage.close();
	}

	private boolean isInputValid(){
        if (numberTextField.getText().isEmpty() || allPlacesNumberTextField.getText().isEmpty() || headerTextField.getText().isEmpty()){        	
        	Alert alert = new Alert(AlertType.ERROR);
            alert.initOwner(mainApp.getPrimaryStage());
            alert.setTitle("Invalid Fields");
            alert.setHeaderText("Please fill out all red fields.");
            alert.setContentText(null);
            alert.showAndWait();
        	return false;
        } else {
        	return true;
        }
	}

	public MainApp getMainApp() {
		return mainApp;
	}

	public void setMainApp(MainApp mainApp) {
		this.mainApp = mainApp;
	}

	public void setObject(Object object) {
		this.object = object;
		if (object!=null){
			graveClass = (object.getClass()==Grave.class);
		}
	}

	public boolean isOkClicked() {
		return okClicked;
	}

	public void setOkClicked(boolean okClicked) {
		this.okClicked = okClicked;
	}

	public boolean isChange() {
		return change;
	}

	public void setChange(boolean change) {
		this.change = change;
	}
}
