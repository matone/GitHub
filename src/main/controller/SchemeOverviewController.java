package main.controller;

import java.text.DateFormat;
import java.util.List;
import java.util.ResourceBundle;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.control.TreeTableColumn.CellDataFeatures;
import javafx.scene.control.TreeTableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.Alert.AlertType;
import main.MainApp;
import main.model.Funeral;
import main.model.Management;
import main.model.Rent;
import main.model.people.Deceased;
import main.model.people.Manager;
import main.model.people.Owner;
import main.model.people.Person;
import main.model.places.Grave;
import main.model.places.Sector;
import main.util.HibernateUtil;

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
	private SessionFactory sf = HibernateUtil.getSessionFactory();
    
    
	
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

		Session session = sf.openSession();
		Transaction t = session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<Sector> listSector = session.createSQLQuery("SELECT * FROM sector").addEntity(Sector.class).list();
		for (Sector sector : listSector) {
			TreeItem<Object> item = new TreeItem<Object>(sector);
			root.getChildren().add(item);
			@SuppressWarnings("unchecked")
			List<Grave> listGrave = session.createSQLQuery("SELECT * FROM grave g WHERE g.sector_id = "+sector.getId()).addEntity(Grave.class).list();
			for (Grave grave : listGrave) {
				item.getChildren().add(new TreeItem<Object>(grave));
			}
		}
		
		t.commit();
		session.close();
		
		
		sectorTreeTable.getSelectionModel().selectedItemProperty().addListener(
				(observable, oldValue, newValue) -> showSelectedDetails(newValue.getValue()));
		
		leftTableView.getSelectionModel().selectedItemProperty().addListener(
				(observable, oldValue, newValue) -> showPersonDetails(newValue));
		
		rightTableView.getSelectionModel().selectedItemProperty().addListener(
				(observable, oldValue, newValue) -> showDeceasedDetails(newValue));		
		
		sectorColumn.setCellValueFactory(
				(CellDataFeatures<Object, String> p) -> getString(p.getValue().getValue()));

		
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
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void showSelectedDetails(Object object){
		
		if ((object != null) && (object!=sectorTreeTable.getRoot().getValue())){
			
			Session session = sf.openSession();
			
			if ((object.getClass()==Grave.class) && (session.createSQLQuery("SELECT * FROM grave WHERE id = "+((Grave)object).getId()).uniqueResult()!=null)){				
				List ownerList = session.createSQLQuery("SELECT o.id, first_name, last_name, city, street, postal_code, email, phone_number FROM owner o "
											+ "JOIN rent r ON o.id = r.owner_id "
											+ "JOIN grave g ON r.grave_id = g.id "
											+ "WHERE g.id = "+((Grave)object).getId()).addEntity(Owner.class).list();
				ObservableList<Person> ownerObsList = FXCollections.observableArrayList(ownerList);
				leftTableView.setItems(ownerObsList);
				
				List deceasedList = session.createSQLQuery("SELECT d.id, first_name, last_name, d.age FROM deceased d "
											+ "JOIN funeral f ON d.id = f.deceased_id "
											+ "JOIN grave g ON f.grave_id = g.id "
											+ "WHERE g.id = "+((Grave)object).getId()).addEntity(Deceased.class).list();
				ObservableList<Deceased> deceasedObsList = FXCollections.observableArrayList(deceasedList);
				rightTableView.setItems(deceasedObsList);
								
				titleLabel.setText(resourceBundle.getString("grave") + " " + ((Grave)object).getGraveNumber());
				headerLabel.setText(resourceBundle.getString("sector") + ": " +	Integer.toString(((Sector) (sectorTreeTable.getSelectionModel().getSelectedItem().getParent().getValue())).getSectorNumber()));
				allPlacesNumberLabel.setText(resourceBundle.getString("allPlacesNumberLabel") + ": " + ((Grave)object).getAllPlacesNumber());
				fullPlacesNumberLabel.setText(resourceBundle.getString("fullPlacesNumberLabel") + ": " + ((Grave)object).getFullPlacesNumber());
				leftColumn.setText(resourceBundle.getString("firstBottomColumnGrave"));
				rightColumn.setText(resourceBundle.getString("secondBottomColumnGrave"));
				newPersonButton.setText(resourceBundle.getString("newPersonButtonGrave"));				
			} else if (session.createSQLQuery("SELECT * FROM sector WHERE id = "+((Sector)object).getId()).uniqueResult()!=null){
				List sectorList = session.createSQLQuery("SELECT m.id, first_name, last_name, city, street, postal_code, email, phone_number FROM manager m "
											+ "JOIN management ms ON m.id = ms.manager_id "
											+ "JOIN sector s ON ms.sector_id = s.id "
											+ "WHERE s.id = "+((Sector)object).getId()).addEntity(Manager.class).list();
				ObservableList<Person> sectorObsList = FXCollections.observableArrayList(sectorList);
				leftTableView.setItems(sectorObsList);
				rightTableView.setItems(null);
				titleLabel.setText(resourceBundle.getString("sector") + " " + Integer.toString(((Sector)object).getSectorNumber()));
				headerLabel.setText((resourceBundle.getString("size")) + ": " + Integer.toString(((Sector)object).getSize()) + "m^2");
				allPlacesNumberLabel.setText(resourceBundle.getString("allPlacesNumberLabel") + ": " + Integer.toString(((Sector)object).getAllGravesNumber()));
				fullPlacesNumberLabel.setText(resourceBundle.getString("fullPlacesNumberLabel") + ": " + Integer.toString(((Sector)object).getFullGravesNumber()));
				leftColumn.setText(resourceBundle.getString("firstBottomColumnSector"));
				newPersonButton.setText(resourceBundle.getString("newPersonButtonSector"));
			}
			session.close();
		} else{
			titleLabel.setText("");
			headerLabel.setText("");
			allPlacesNumberLabel.setText("");
			fullPlacesNumberLabel.setText("");
			leftTableView.getItems().clear();
			rightTableView.getItems().clear();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void showPersonDetails(Person person){
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
			
			Session session = sf.openSession();
			
			Object object = sectorTreeTable.getSelectionModel().getSelectedItem().getValue();
			
			if (object.getClass()==Grave.class){
				Grave grave = (Grave)object;
				List<Rent> list = session.createSQLQuery("SELECT * FROM rent WHERE grave_id="+grave.getId()+" AND owner_id="+person.getId()).addEntity(Rent.class).list();
				dateFromListView.getItems().clear();
				dateToListView.getItems().clear();
				for (Rent rent : list) {
					dateFromListView.getItems().add(DateFormat.getInstance().format(rent.getDateFrom().getTime()));
					if (rent.getDateTo() != null) {
						dateToListView.getItems().add(DateFormat.getInstance().format(rent.getDateTo().getTime()));
					} else{
						dateToListView.getItems().add("-");
					}
				}
			} else{
				Sector sector = (Sector)object;
				List<Management> list = session.createSQLQuery("SELECT * FROM management WHERE sector_id="+sector.getId()+" AND manager_id="+person.getId()).addEntity(Management.class).list();
				dateFromListView.getItems().clear();
				dateToListView.getItems().clear();
				for (Management management : list) {
					dateFromListView.getItems().add(DateFormat.getInstance().format(management.getDateFrom().getTime()));
					if (management.getDateTo() != null) {
						dateToListView.getItems().add(DateFormat.getInstance().format(management.getDateFrom().getTime()));
					} else {
						dateToListView.getItems().add("-");
					} 
				}
			}
			session.close();
		} else{
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
	
	@SuppressWarnings("unchecked")
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
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			dateFromListView.getItems().clear();
			dateToListView.getItems().clear();
			List<Funeral> list = session.createSQLQuery("SELECT * FROM funeral WHERE deceased_id = "+deceased.getId()).addEntity(Funeral.class).list();
			for (Funeral funeral : list) {
				dateFromListView.getItems().add(DateFormat.getInstance().format(funeral.getDateFrom().getTime()));
				if (funeral.getDateTo() != null) {
					dateToListView.getItems().add(DateFormat.getInstance().format(funeral.getDateTo().getTime()));
				} else {
					dateToListView.getItems().add("-");
				} 
			}
			session.close();
		} else{
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
			
			Session session = sf.openSession();
			Transaction t = session.beginTransaction();
			session.persist(sector);
			t.commit();
			session.close();
			
			root.getChildren().add(new TreeItem<Object>(sector));
			Alert alert = new Alert(AlertType.INFORMATION);
			alert.setTitle("New Grave");
			alert.setContentText(null);
			alert.setHeaderText("New Grave Was Successfully Created.");
			alert.showAndWait();
		}
	}
	
	@FXML
	private void handleNewGraveButton(){
		Grave grave = new Grave();
		boolean added = false;
		boolean done = mainApp.showSectorChangeDialog(grave, false);
		if (done){
			for (TreeItem<Object> item : root.getChildren()) {
				if (((Sector)item.getValue()).getSectorNumber()==grave.getSector().getSectorNumber()){
					Sector sector = (Sector)item.getValue();
					item.getChildren().add(new TreeItem<Object>(grave));
					added=true;
					grave.setSector(sector);
					SessionFactory sf = HibernateUtil.getSessionFactory();
					Session session = sf.openSession();
					session.createSQLQuery("UPDATE sector SET full_graves_number = (full_graves_number + 1) WHERE id = "+ sector.getId()).executeUpdate();
					sector.setFullGravesNumber(sector.getFullGravesNumber()+1);
					Transaction t = session.beginTransaction();
					session.persist(grave);
					t.commit();
					session.close();
					break;
				}
			}
			Alert alert = new Alert(AlertType.INFORMATION);
			alert.setTitle("New Grave");
			alert.setContentText(null);
			if (added){
				alert.setHeaderText("New Grave Was Successfully Created.");
			} else{
				alert.setHeaderText("New Grave was not created. Sector number " + grave.getSector().getSectorNumber()+" does not exist.");			
			}
			alert.showAndWait();
		}
	}
	
	@FXML
	private void handleChangeButton(){
		if ((!sectorTreeTable.getSelectionModel().getSelectedCells().isEmpty())&&(sectorTreeTable.getSelectionModel().getSelectedIndex()!=0)){
			
			Session session = sf.openSession();
			Transaction t = session.beginTransaction();
			Object object = sectorTreeTable.getSelectionModel().getSelectedItem().getValue();
			if (object.getClass() == Grave.class) {
				if (session.createSQLQuery("SELECT * FROM grave WHERE id = "+((Grave)object).getId()).uniqueResult()!=null){
					mainApp.showSectorChangeDialog(object, true);
					showSelectedDetails(sectorTreeTable.getSelectionModel().getSelectedItem().getValue());
					session.createSQLQuery("UPDATE grave SET (all_places_number, grave_number) = ("
							+ ((Grave) object).getAllPlacesNumber() + ", " + ((Grave) object).getGraveNumber() + ")"
							+ " WHERE id = " + ((Grave) object).getId()).executeUpdate();
				}
			}else {
				if (session.createSQLQuery("SELECT * FROM sector WHERE id = "+((Sector)object).getId()).uniqueResult()!=null){
					mainApp.showSectorChangeDialog(object, true);
					session.createSQLQuery("UPDATE sector SET (all_graves_number, sector_number, size) = ("
							+ ((Sector) object).getAllGravesNumber() + ", " + ((Sector) object).getSectorNumber() + ", "
							+ ((Sector) object).getSize() + ")" + " WHERE id = " + ((Sector) object).getId())
							.executeUpdate();
				}
			}
			t.commit();
			session.close();
		} else{
			Alert alert = new Alert(AlertType.ERROR);
			alert.setTitle("No Item Selected");
			alert.setHeaderText("Please select one item from the table.");
			alert.setContentText(null);
			alert.showAndWait();
		}
	}
	
	@FXML
	private void handleRemoveButton(){
		TreeItem<Object> selected = sectorTreeTable.getSelectionModel().getSelectedItem();
		if ((!sectorTreeTable.getSelectionModel().getSelectedCells().isEmpty())&&(sectorTreeTable.getSelectionModel().getSelectedIndex()!=0)){
			selected.getParent().getChildren().remove(selected);
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			if (selected.getValue().getClass()==Grave.class){
				session.createSQLQuery("DELETE FROM rent WHERE grave_id = " + ((Grave)selected.getValue()).getId()).executeUpdate();
				session.createSQLQuery("DELETE FROM grave WHERE id = " + ((Grave)selected.getValue()).getId()).executeUpdate();
			} else{
				session.createSQLQuery("DELETE FROM management WHERE sector_id = " + ((Sector)selected.getValue()).getId()).executeUpdate();
				session.createSQLQuery("DELETE FROM sector WHERE id = " + ((Sector)selected.getValue()).getId()).executeUpdate();
			}
			session.close();
		} else{
			Alert alert = new Alert(AlertType.ERROR);
			alert.setTitle("No Item Selected");
			alert.setHeaderText("Please select one item from the table.");
			alert.setContentText(null);
			alert.showAndWait();
		}
		
	}
	
	@FXML
	private void handleNewPersonButton(){
		Object object = sectorTreeTable.getSelectionModel().getSelectedItem().getValue();
		boolean done = mainApp.showNewPersonDialog(object, null);
		if (done){
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
		Object person;
		person = leftTableView.getSelectionModel().getSelectedItem();		
		boolean done = mainApp.showNewPersonDialog(object, (Person)person);
		if (done){
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
