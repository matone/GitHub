package main.controller;

import java.util.ResourceBundle;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.paint.Paint;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import javafx.scene.text.TextFlow;
import main.MainApp;

public class IntroductionController {
	@FXML
	private Label introductionLabel;
	@FXML
	private TextFlow introductionTextFlow;
	
	private MainApp mainApp;
	private ObservableList<Text> list = FXCollections.observableArrayList();
	
	public IntroductionController(MainApp mainApp) {
		setMainApp(mainApp);
	}
	
	@FXML
	private void initialize(){
		list.clear();
		Text text = new Text("Welcome !!!\nThis is an awesome APP\nUSE WITH CAUTION\n \n");
		text.setLineSpacing(1.5);
		text.setFont(Font.font("Verdana", 25));
		text.setFill(Paint.valueOf("Green"));
		list.add(text);
		introductionTextFlow.getChildren().setAll(list);
		introductionTextFlow.setTextAlignment(TextAlignment.CENTER);
		resetText();
	}
	
	public void resetText(){
		ResourceBundle resourceBundle = mainApp.getResourceBundle();
		introductionLabel.setText(resourceBundle.getString("introductionLabel"));
	}

	public MainApp getMainApp() {
		return mainApp;
	}

	public void setMainApp(MainApp mainApp) {
		this.mainApp = mainApp;
	}

}
