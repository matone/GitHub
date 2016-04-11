package main.controller;

import main.MainApp;

import javafx.scene.control.Button;
import javafx.scene.control.Label;

import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.scene.control.SplitPane;
import javafx.scene.layout.AnchorPane;

public class MainWindowController {
	
	@FXML
	private SplitPane splitPane;
	@FXML
	private AnchorPane rightArchorPane;
	@FXML
	private Label languageLabel;
	@FXML
	private Button languageButton;
	@FXML
	private Button funeralButton;
	@FXML
	private Button exhumationButton;
	@FXML
	private Button schemeOverviewButton;
	@FXML
	private Button searchButton;
	@FXML
	private Button endButton;
	@FXML
	private Button introButton;
	@FXML
	private Button calendarButton;
	@FXML
	private Button statisticsButon;
	
	
	private MainApp mainApp;
	
	public MainWindowController(MainApp mainApp) {
		setMainApp(mainApp);
	}
	
	public void resetText(){
		ResourceBundle resourceBundle = mainApp.getResourceBundle();
		calendarButton.setText(resourceBundle.getString("calendarButton"));
		introButton.setText(resourceBundle.getString("introButton"));
		languageLabel.setText(resourceBundle.getString("languageLabel"));
		languageButton.setText(resourceBundle.getString("languageButton"));
		funeralButton.setText(resourceBundle.getString("funeralButton"));
		exhumationButton.setText(resourceBundle.getString("exhumationButton"));
		schemeOverviewButton.setText(resourceBundle.getString("schemeOverviewButton"));
		searchButton.setText(resourceBundle.getString("searchButton"));
		endButton.setText(resourceBundle.getString("endButton"));
		statisticsButon.setText(resourceBundle.getString("statistics"));
	}
	
	@FXML
	private void initialize(){
		resetText();
		calendarButton.setDisable(true);
		mainApp.showIntroductionPane();
	}
	
	@FXML
	private void handleFuneralButton(){
		mainApp.showFuneralRegistrationPane();
	}
	
	@FXML
	private void handleExhumationButton(){
		mainApp.showExhumationRegistrationPane();
	}
	
	@FXML
	private void handleSchemeOverviewButton(){
		mainApp.showSchemeOverviewPane();
	}	
	
	@FXML
	private void handleStatisticsButon(){
		mainApp.showStatisticsPane();
	}	
	
	@FXML
	private void handleSearchButton(){
		mainApp.showSearchPane();
	}	
	
	@FXML
	private void handleEndButton(){
		mainApp.closePrimaryStage();
	}
	
	@FXML
	private void handleLanguageButton(){
		mainApp.changeLanguage();
	}
	
	@FXML
	private void handleIntroButton(){
		mainApp.showIntroductionPane();
	}
	
	public void setRightAnchorPane(AnchorPane anchorPane){
    	splitPane.getItems().set(1, anchorPane);
    }
	
	public MainApp getMainApp() {
		return mainApp;
	}

	public void setMainApp(MainApp mainApp) {
		this.mainApp = mainApp;
	}
	

}

