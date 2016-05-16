package main.controller;

import java.rmi.Remote;
import java.security.Permissions;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.ResourceBundle;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.control.TreeTableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.TreeTableColumn.CellDataFeatures;
import main.MainApp;
import model.Funeral;
import model.Management;
import model.Rent;
import model.people.Deceased;
import model.people.Manager;
import model.people.Owner;
import model.people.Person;
import model.places.Grave;
import model.places.Sector;
import remote.HibFacadeBeanRemote;


public class SchemeOverviewController {
	
	@FXML
	private TreeTableView<Object> sectorTreeTable;
	@FXML
	private TreeTableColumn<Object, String> sectorColumn;
	@FXML
	private TableView<Person> leftTableView;
	@FXML
	private TableView<Deceased> rightTableView;
	@FXML
	private ListView<String> dateFromListView;
	@FXML
	private ListView<String> dateToListView;
	@FXML
	private TableColumn<Person, String> leftColumn;
	@FXML
	private TableColumn<Person, String> leftFirstNameColumn;
	@FXML
	private TableColumn<Person, String> leftLastNameColumn;
	@FXML
	private TableColumn<Deceased, String> rightColumn;
	@FXML
	private TableColumn<Deceased, String> rightFirstNameColumn;
	@FXML
	private TableColumn<Deceased, String> rightLastNameColumn;
	@FXML
	private Button newSectorButton;
	@FXML
	private Button newGraveButton;
	@FXML
	private Button changeButton;
	@FXML
	private Button removeButton;
	@FXML
	private Button newPersonButton;
	@FXML
	private Button changePersonButton;
	@FXML
	private Button funeralButton;
	@FXML
	private Label titleLabel;
	@FXML
	private Label headerLabel;
	@FXML
	private Label allPlacesNumberLabel;
	@FXML
	private Label fullPlacesNumberLabel;
	@FXML
	private Label infoLabel;
	@FXML
	private Label firstNameLabel;
	@FXML
	private Label firstName;
	@FXML
	private Label lastNameLabel;
	@FXML
	private Label lastName;
	@FXML
	private Label cityLabel;
	@FXML
	private Label city;
	@FXML
	private Label streetLabel;
	@FXML
	private Label street;
	@FXML
	private Label postalCodeLabel;
	@FXML
	private Label postalCode;
	@FXML
	private Label phoneNumberLabel;
	@FXML
	private Label phoneNumber;
	@FXML
	private Label emailLabel;
	@FXML
	private Label email;
	@FXML
	private Label dateFromLabel;
	@FXML
	private Label dateFrom;
	@FXML
	private Label dateToLabel;
	@FXML
	private Label dateTo;
	
	private MainApp mainApp;
	private TreeItem<Object> root;
	private ResourceBundle resourceBundle;
	private boolean initialized=false;
    
    
	
	public SchemeOverviewController(MainApp mainApp){
		this.mainApp = mainApp;
	}
	
	@FXML
	private void initialize(){
	
		resetText();
		setInitialized(true);
	
		root = new TreeItem<Object>();
		root.setExpanded(true);
		sectorTreeTable.setRoot(root);
		
		HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
			
			
		List<Sector> sectors = remote.getSectorTree();
		for (Sector curSector : sectors) {
			
			TreeItem<Object> item = new TreeItem<Object>(curSector);
			root.getChildren().add(item);
		
			for (Grave curGrave : curSector.getGraves()) {
				curGrave.setSector(curSector);
				item.getChildren().add(new TreeItem<Object>(curGrave));
			}
		}

		
		
		sectorTreeTable.getSelectionModel().selectedItemProperty().addListener(
				(observable, oldValue, newValue) -> showSelectedDetails(newValue.getValue()));
		
		leftTableView.getSelectionModel().selectedItemProperty().addListener(
				(observable, oldValue, newValue) -> showPersonDetails(newValue));
		
		rightTableView.getSelectionModel().selectedItemProperty().addListener(
				(observable, oldValue, newValue) -> showDeceasedDetails(newValue));
		
		sectorColumn.setCellValueFactory((CellDataFeatures<Object, String> p) -> getString(p.getValue().getValue()));
		
		leftFirstNameColumn.setCellValueFactory(new PropertyValueFactory<Person,String>("firstName"));
		leftLastNameColumn.setCellValueFactory(new PropertyValueFactory<Person,String>("lastName"));
		
		rightFirstNameColumn.setCellValueFactory(new PropertyValueFactory<Deceased,String>("firstName"));
		rightLastNameColumn.setCellValueFactory(new PropertyValueFactory<Deceased,String>("lastName"));
		
	}
	
	public void resetText(){
		resourceBundle = mainApp.getResourceBundle();
		newSectorButton.setText(resourceBundle.getString("newSectorButton"));
		newGraveButton.setText(resourceBundle.getString("newGraveButton"));
		changeButton.setText(resourceBundle.getString("changeButton"));
		removeButton.setText(resourceBundle.getString("removeButton"));
		changePersonButton.setText(resourceBundle.getString("changeButton"));
		
		infoLabel.setText(resourceBundle.getString("personalInfoLabel"));
		firstNameLabel.setText(resourceBundle.getString("firstNameLabel"));
		lastNameLabel.setText(resourceBundle.getString("lastNameLabel"));
		funeralButton.setText(resourceBundle.getString("funeralButton"));
		
		showPersonDetails(null);
		showSelectedDetails(null);
	}
	
	public ObservableValue<String> getString(Object object){
		SimpleStringProperty temp = new SimpleStringProperty();
		if (object != sectorTreeTable.getRoot().getValue()){
			if (object.getClass() == Grave.class){
				temp.set(resourceBundle.getString("grave") + " "
						+ Integer.toString(((Grave) object).getGraveNumber()));
			} else {
				temp.set(resourceBundle.getString("sector") + " "
						+ Integer.toString(((Sector) object).getSectorNumber()));
			}
		} else{
			temp.set(resourceBundle.getString("graveyard"));
		}
		return temp;
	}
	
	public void showSelectedDetails(Object object) {
		
		if ((object != null) && (object!=sectorTreeTable.getRoot().getValue())) {
			
			if (object.getClass()==Grave.class) {	
				Grave grave = null;
				
				HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
					
				grave = remote.getGraveById(((Grave)object).getId());
				
				List<Owner> ownerList = new ArrayList<Owner>();
				
				for (Rent curRent : grave.getRents()) {
					ownerList.add(curRent.getOwner());
				}
				
				List<Deceased> deceasedList = new ArrayList<Deceased>();
				
				for (Funeral curFuneral : grave.getFunerals()) {
					deceasedList.add(curFuneral.getDeceased());
				}
				
				ObservableList<Person> ownerObsList = FXCollections.observableArrayList(ownerList);
				leftTableView.setItems(ownerObsList);
				
				
				ObservableList<Deceased> deceasedObsList = FXCollections.observableArrayList(deceasedList);
				rightTableView.setItems(deceasedObsList);
								
				titleLabel.setText(resourceBundle.getString("grave") + " " + grave.getGraveNumber());
				headerLabel.setText(resourceBundle.getString("sector") + ": " +	Integer.toString(grave.getSector().getSectorNumber()));
				allPlacesNumberLabel.setText(resourceBundle.getString("allPlacesNumberLabel") + ": " + grave.getAllPlacesNumber());
				fullPlacesNumberLabel.setText(resourceBundle.getString("fullPlacesNumberLabel") + ": " + grave.getFullPlacesNumber());
				leftColumn.setText(resourceBundle.getString("firstBottomColumnGrave"));
				rightColumn.setText(resourceBundle.getString("secondBottomColumnGrave"));
				newPersonButton.setText(resourceBundle.getString("newPersonButtonGrave"));	
				
				if (grave.getAllPlacesNumber() > grave.getFullPlacesNumber()) {
					funeralButton.setDisable(false);
				} else {
					funeralButton.setDisable(true);
				}
				
			} else {
				Sector sector = null;
				
				HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
				
				sector = remote.getSectorById(((Sector)object).getId());
				
				List<Manager> managerList = new ArrayList<Manager>();
				
				for (Management curManagement : sector.getManagements()) {
					managerList.add(curManagement.getManager());
				}
				
				ObservableList<Person> managerObsList = FXCollections.observableArrayList(managerList);
				
				leftTableView.setItems(managerObsList);
				rightTableView.setItems(null);
				titleLabel.setText(resourceBundle.getString("sector") + " " + Integer.toString(sector.getSectorNumber()));
				headerLabel.setText((resourceBundle.getString("size")) + ": " + Integer.toString(sector.getSize()) + "m^2");
				allPlacesNumberLabel.setText(resourceBundle.getString("allPlacesNumberLabel") + ": " + Integer.toString(sector.getAllGravesNumber()));
				fullPlacesNumberLabel.setText(resourceBundle.getString("fullPlacesNumberLabel") + ": " + Integer.toString(sector.getFullGravesNumber()));
				leftColumn.setText(resourceBundle.getString("firstBottomColumnSector"));
				newPersonButton.setText(resourceBundle.getString("newPersonButtonSector"));
				
				funeralButton.setDisable(true);
			}
		} else {
			titleLabel.setText("");
			headerLabel.setText("");
			allPlacesNumberLabel.setText("");
			fullPlacesNumberLabel.setText("");
			leftTableView.getItems().clear();
			rightTableView.getItems().clear();
			funeralButton.setDisable(true);
		}
	}	
	
	public void showPersonDetails(Person person) {
		if (person!=null) {
			
			rightTableView.getSelectionModel().clearSelection();
			cityLabel.setText(resourceBundle.getString("cityLabel"));
			streetLabel.setText(resourceBundle.getString("streetLabel"));
			postalCodeLabel.setText(resourceBundle.getString("postalCodeLabel"));
			phoneNumberLabel.setText(resourceBundle.getString("phoneNumberLabel"));
			emailLabel.setText(resourceBundle.getString("emailLabel"));
			dateFromLabel.setText(resourceBundle.getString("from"));
			dateToLabel.setText(resourceBundle.getString("to"));
			changePersonButton.setDisable(false);
			
			firstName.setText(person.getFirstName());
			lastName.setText(person.getLastName());
			city.setText(person.getCity());
			street.setText(person.getStreet());
			postalCode.setText(person.getPostalCode());
			phoneNumber.setText(person.getPhoneNumber());
			email.setText(person.getEmail());
			
			Object object = sectorTreeTable.getSelectionModel().getSelectedItem().getValue();
			
			if (object.getClass()==Grave.class) {
				Grave grave = (Grave)object;
				
				dateFromListView.getItems().clear();
				dateToListView.getItems().clear();
				
				HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
					
				List<Rent> rents = remote.getRentsByGraveOwner(grave.getId(), person.getId());
					
				for (Rent rent : rents) {
					dateFromListView.getItems().add(DateFormat.getInstance().format(rent.getDateFrom().getTime()));
					if (rent.getDateTo() != null) {
						dateToListView.getItems().add(DateFormat.getInstance().format(rent.getDateTo().getTime()));
					} else{
						dateToListView.getItems().add("-");
					}
				}
				
			} else {
				Sector sector = (Sector)object;
				
				dateFromListView.getItems().clear();
				dateToListView.getItems().clear();
				
				HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
				
				List<Management> managemets = remote.getManagementsBySectorManager(sector.getId(), person.getId());
				
				for (Management management : managemets) {
					dateFromListView.getItems().add(DateFormat.getInstance().format(management.getDateFrom().getTime()));
					if (management.getDateTo() != null) {
						dateToListView.getItems().add(DateFormat.getInstance().format(management.getDateFrom().getTime()));
					} else {
						dateToListView.getItems().add("-");
					} 
				}
			}
		} else {
			firstName.setText(null);
			lastName.setText(null);
			city.setText(null);
			street.setText(null);
			postalCode.setText(null);
			phoneNumber.setText(null);
			email.setText(null);
			dateFromListView.getItems().clear();
			dateToListView.getItems().clear();
		}
	}
	
	private void showDeceasedDetails(Deceased deceased) {	
		if (deceased!=null) {
			leftTableView.getSelectionModel().clearSelection();
			cityLabel.setText(resourceBundle.getString("age"));
			streetLabel.setText(null);
			postalCodeLabel.setText(null);
			phoneNumberLabel.setText(null);
			emailLabel.setText(null);
			dateFromLabel.setText(resourceBundle.getString("from"));
			dateToLabel.setText(resourceBundle.getString("to"));
			changePersonButton.setDisable(true);
			
			firstName.setText(deceased.getFirstName());
			lastName.setText(deceased.getLastName());
			city.setText(Integer.toString(deceased.getAge()));
			street.setText(null);
			postalCode.setText(null);
			phoneNumber.setText(null);
			email.setText(null);
			
			dateFromListView.getItems().clear();
			dateToListView.getItems().clear();
			
			Grave grave = (Grave)sectorTreeTable.getSelectionModel().getSelectedItem().getValue();
			
			HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
			
			List<Funeral> funerals = remote.getFuneralsByGraveDeceased(grave.getId(), deceased.getId());
			
			for (Funeral funeral : funerals) {
				dateFromListView.getItems().add(DateFormat.getInstance().format(funeral.getDateFrom().getTime()));
				if (funeral.getDateTo() != null) {
					dateToListView.getItems().add(DateFormat.getInstance().format(funeral.getDateTo().getTime()));
				} else {
					dateToListView.getItems().add("-");
				} 
			}
		} else {
			firstName.setText(null);
			lastName.setText(null);
			city.setText(null);
			street.setText(null);
			postalCode.setText(null);
			phoneNumber.setText(null);
			email.setText(null);
			dateFromListView.getItems().clear();
			dateToListView.getItems().clear();
		}
	}
	

	@FXML
	private void handleNewSectorButton(){
		Sector sector = new Sector();
		boolean done = mainApp.showSectorChangeDialog(sector, false);
		if (done){		
			
			HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
			
			sector.setId(remote.insertSector(sector));
			if (sector.getId() != -1){
			root.getChildren().add(new TreeItem<Object>(sector));
			Alert alert = new Alert(AlertType.INFORMATION);
			alert.setTitle("New Grave");
			alert.setContentText(null);
			alert.setHeaderText("New Grave Was Successfully Created.");
			alert.showAndWait();
			}
		}
	}
	
	@FXML
	private void handleNewGraveButton() {
		Grave grave = new Grave();
		String msg;
		boolean done = mainApp.showSectorChangeDialog(grave, false);
		if (done) {
			
			HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
			
			TreeItem<Object> item = sectorTreeTable.getSelectionModel().getSelectedItem();
			
			Sector sector = (Sector)item.getValue();
					
			grave.setId(remote.createGrave(grave, sector));		
			
			if (grave.getId() != null) {
				msg = "New Grave Was Successfully Created.";
				item.getChildren().add(new TreeItem<Object>(grave));
				sector.setFullGravesNumber(sector.getFullGravesNumber()+1);
			} else {
				msg = "New Grave was not created to sector number " + grave.getSector().getSectorNumber()+".";			
			}
			
			Alert alert = new Alert(AlertType.INFORMATION);
			alert.setTitle("New Grave");
			alert.setContentText(null);
			alert.setHeaderText(msg);
			alert.showAndWait();
		}
	}

	@FXML
	private void handleFuneralButton() {
		Owner owner = null;
		for (Object object : leftTableView.getItems().toArray()) {
			
		}
		
		mainApp.showFuneralRegistrationDialog((Grave)sectorTreeTable.getSelectionModel().getSelectedItem().getValue());
	}
	
	@FXML
	private void handleChangeButton() {
		
		HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
		
		Object object = sectorTreeTable.getSelectionModel().getSelectedItem().getValue();
		if (object.getClass() == Grave.class) {
			mainApp.showSectorChangeDialog(object, true);
			remote.updateGrave((Grave)object);		
			showSelectedDetails(sectorTreeTable.getSelectionModel().getSelectedItem().getValue());
		}else {
			mainApp.showSectorChangeDialog(object, true);
			remote.updateSector((Sector)object);		
			showSelectedDetails(sectorTreeTable.getSelectionModel().getSelectedItem().getValue());	
		}
	}
	
	@FXML
	private void handleRemoveButton() {
		TreeItem<Object> selected = sectorTreeTable.getSelectionModel().getSelectedItem();
		selected.getParent().getChildren().remove(selected);
		HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
		
		if (selected.getValue().getClass()==Grave.class){
			remote.removeGrave((Grave)selected.getValue());
		} else{
			remote.removeSector((Sector)selected.getValue());
		}		
	}
	
	@FXML
	private void handleNewPersonButton() {
		Object object = sectorTreeTable.getSelectionModel().getSelectedItem().getValue();
		boolean done;
		boolean classStyle;
		Person person;
		
		if (object.getClass() == Grave.class) {
			person = new Owner();
			classStyle = true;
		} else {
			person = new Manager();
			classStyle = false;
		}
		
		done = mainApp.showNewPersonDialog(person, classStyle);
		
		HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
		
		if (done) {
			if (classStyle) {
				remote.insertOwner((Owner)person,(Grave)object);
			} else {
				remote.insertManager((Manager)person,(Sector)object);
			}
			
			Alert alert = new Alert(AlertType.INFORMATION);
			alert.setTitle("New");
			alert.setContentText(null);
			alert.setHeaderText("The Creation Was Successful.");
			alert.showAndWait();
		}
	}
	
	@FXML
	private void handleChangePersonButton(){
		Object object = sectorTreeTable.getSelectionModel().getSelectedItem().getValue();
		boolean done;
		boolean classStyle;
		Person person = leftTableView.getSelectionModel().getSelectedItem();
		
		if (object.getClass() == Grave.class) {
			classStyle = true;
		} else {
			classStyle = false;
		}
		
		done = mainApp.showNewPersonDialog(person, classStyle);
		
		HibFacadeBeanRemote remote = mainApp.getFacadeRemoteUtil().getHibFacadeBeanRemote();
		
		if (done) {
			if (object.getClass() == Grave.class) {
				remote.updateOwner((Owner)person);
			} else {
				remote.updateManager((Manager)person);
			}
			Alert alert = new Alert(AlertType.INFORMATION);
			alert.setTitle("Change");
			alert.setContentText(null);
			alert.setHeaderText(person.getClass().getCanonicalName() + " Was Successfully Changed.");
			alert.showAndWait();
		}
	}
	
	public boolean isInitialized() {
		return initialized;
	}

	public void setInitialized(boolean initialized) {
		this.initialized = initialized;
	}	
}
