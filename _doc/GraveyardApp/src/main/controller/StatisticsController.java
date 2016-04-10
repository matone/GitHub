package main.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Iterator;
import java.util.ResourceBundle;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javafx.fxml.FXML;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.XYChart;
import javafx.scene.chart.XYChart.Series;
import javafx.scene.control.Label;
import javafx.scene.control.Tab;
import main.MainApp;
import main.util.HibernateUtil;

public class StatisticsController {
	@FXML
	private Tab funeralStatsTab;
	@FXML
	private Label statisticsLabel;
	@FXML
	private LineChart<String, BigDecimal> firstChart;
	@FXML
	private BarChart<String, BigInteger> secondChart;
	@FXML
	private BarChart<String, BigInteger> thirdChart;

	
	private MainApp mainApp;	
	
	public StatisticsController(MainApp mainApp) {
		setMainApp(mainApp);
	}
	
	@FXML
	private void initialize(){
		initializeFirstGraph();
		initializeSecondGraph();
		initializeThirdGraph();
		resetText();
		
	}
	
	public void resetText(){
		ResourceBundle resourceBundle = mainApp.getResourceBundle();
		statisticsLabel.setText(resourceBundle.getString("statistics"));
		
	}
	
	@SuppressWarnings("rawtypes")
	public void initializeFirstGraph(){
		XYChart.Series<String, BigDecimal> series = new Series<String, BigDecimal>();
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Iterator iterator = session.createSQLQuery("SELECT  date_part('year', f.date_from) AS year, AVG(age) AS age "
													+"FROM funeral f "
													+"JOIN deceased d "
													+"ON f.deceased_id = d.id "
													+"GROUP BY year "
													+"ORDER BY year").list().iterator();
		while (iterator.hasNext()){
			Object[] row = (Object[]) iterator.next();
			series.getData().add(new XYChart.Data<String, BigDecimal>(Double.toString((double)row[0]), (BigDecimal)row[1]));
		}
		firstChart.getData().add(series);
		session.close();
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void initializeSecondGraph(){
		XYChart.Series<String, BigInteger> firstSeries = new Series<String, BigInteger>();
		XYChart.Series<String, BigInteger> secondSeries = new Series<String, BigInteger>();
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Iterator iterator = session.createSQLQuery("SELECT * FROM"
													+"(SELECT date_part('year', f.date_from) AS year_same, count(a.id) AS same "
													+"FROM applicant a "
													+"JOIN funeral f ON a.id = f.applicant_id "
													+"JOIN grave g ON f.grave_id = g.id "
													+"JOIN rent r ON g.id = r.grave_id "
													+"JOIN owner o ON r.owner_id = o.id "
													+"WHERE o.first_name = a.first_name "
													+"AND o.last_name = a.last_name "
													+"AND o.city = a.city "
													+"AND o.street = a.street "
													+"AND o.postal_code = a.postal_code "
													+"AND o.email = a.email "
													+"AND o.phone_number = a.phone_number "
													+"GROUP BY year_same) AS s "
												+"FULL OUTER JOIN "
													+"(SELECT date_part('year', f.date_from) AS year_different, count(a.id) AS different  "
													+"FROM applicant a "
													+"JOIN funeral f ON a.id = f.applicant_id "
													+"JOIN grave g ON f.grave_id = g.id "
													+"JOIN rent r ON g.id = r.grave_id "
													+"JOIN owner o ON r.owner_id = o.id "
													+"WHERE o.first_name != a.first_name "
													+"OR o.last_name != a.last_name "
													+"OR o.city != a.city "
													+"OR o.street != a.street "
													+"OR o.postal_code != a.postal_code "
													+"OR o.email != a.email "
													+"OR o.phone_number != a.phone_number "
													+"GROUP BY year_different) AS d "
												+"ON s.year_same = d.year_different "
												+"ORDER BY concat(s.year_same, ' ', d.year_different)").list().iterator();
		while (iterator.hasNext()){
			Object[] row = (Object[]) iterator.next();
			if ((row[0]!=null) && (row[2]!=null)){
				firstSeries.getData().add(new XYChart.Data<String, BigInteger>(Double.toString((double)row[0]), (BigInteger)row[1]));
				secondSeries.getData().add(new XYChart.Data<String, BigInteger>(Double.toString((double)row[2]), (BigInteger)row[3]));
			} else if (row[0]==null){
				firstSeries.getData().add(new XYChart.Data<String, BigInteger>(Double.toString((double)row[2]), BigInteger.ZERO));
				secondSeries.getData().add(new XYChart.Data<String, BigInteger>(Double.toString((double)row[2]), (BigInteger)row[3]));
			} else{
				firstSeries.getData().add(new XYChart.Data<String, BigInteger>(Double.toString((double)row[0]), (BigInteger)row[1]));
				secondSeries.getData().add(new XYChart.Data<String, BigInteger>(Double.toString((double)row[0]), BigInteger.ZERO));
			}
		}
		secondChart.getData().addAll(firstSeries, secondSeries);
		session.close();
		
	}
	
	@SuppressWarnings("rawtypes")
	public void initializeThirdGraph(){
		XYChart.Series<String, BigInteger> series = new Series<String, BigInteger>();
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Iterator iterator = session.createSQLQuery("SELECT DATE_PART('month', DATE (CONCAT(f.date_from, e.date_from))) AS m, count(*) "
													+"FROM exhumation e "
													+"FULL OUTER JOIN funeral f "
													+"ON f.id = e.id "
													+"GROUP BY m "
													+"ORDER BY m").list().iterator();
		while (iterator.hasNext()){
			Object[] row = (Object[]) iterator.next();
			series.getData().add(new XYChart.Data<String, BigInteger>(Double.toString((double)row[0]), (BigInteger)row[1]));
		}
		thirdChart.getData().add(series);
		session.close();
	}

	public MainApp getMainApp() {
		return mainApp;
	}

	public void setMainApp(MainApp mainApp) {
		this.mainApp = mainApp;
	}
}
