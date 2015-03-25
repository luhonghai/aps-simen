package uk.ac.gre.swing;

import java.awt.EventQueue;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import uk.ac.gre.entities.Booking;
import uk.ac.gre.soap.IBookingService;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import java.awt.Font;


public class MainWindow {

	private JFrame frame;
	private JTable tblBooking;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					System.out.println("Preparing");
					MainWindow window = new MainWindow();
					System.out.println("Done");
					window.frame.setVisible(true);
			        
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public MainWindow() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		System.out.println("Done iframe");
		frame.setBounds(100, 100, 560, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JButton btnReload = new JButton("Reload");
		btnReload.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				display();
			}
		});
		btnReload.setBounds(423, 11, 117, 29);
		frame.getContentPane().add(btnReload);
		
		tblBooking = new JTable();
		JScrollPane scrollPane = new JScrollPane(tblBooking);
		scrollPane.setBounds(16, 46, 524, 211);
		frame.getContentPane().add(scrollPane);
		
		JLabel lblAirportParkingSystem = new JLabel("Airport parking system");
		lblAirportParkingSystem.setFont(new Font("Lucida Grande", Font.BOLD, 18));
		lblAirportParkingSystem.setBounds(32, 10, 227, 24);
		frame.getContentPane().add(lblAirportParkingSystem);
		display();
	}
	
	private void display() {
		URL url = null;
		try {
			url = new URL("http://localhost:8080/WebApp/BookingService?wsdl");
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //1st argument service URI, refer to wsdl document above
        //2nd argument is service name, refer to wsdl document above
        QName qname = new QName("http://soap.gre.ac.uk/", "BookingServiceService");
        Service service = Service.create(url, qname);
        IBookingService bookingService = service.getPort(IBookingService.class);
        Calendar startCal = Calendar.getInstance();
        startCal.add(Calendar.DATE, -1);
        Calendar toCal = Calendar.getInstance();
        toCal.add(Calendar.DATE, 1);
        Booking[] bookings = bookingService.findAll(startCal.getTimeInMillis(), toCal.getTimeInMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        DefaultTableModel model = new DefaultTableModel();
    	model.addColumn("Type");
    	model.addColumn("Arrival Date");
    	model.addColumn("Departure Date");
    	model.addColumn("Car RegNo");
    	model.addColumn("Car Brand");
    	model.addColumn("Car Model");
        if (bookings == null) {
        } else {
        	
	        for (Booking booking : bookings) {
	        	model.addRow(new Object[] {
	        			booking.getPackingType() == Booking.PACKING_TYPE_DEFAULT 
	        					? "Default"	: (booking.getPackingType() == Booking.PACKING_TYPE_DISABLED
	        							? "Disabled" : "Family"),
	        		    sdf.format(booking.getArrivalDate()),
	        		    sdf.format(booking.getDepartureDate()),
	        		    booking.getCarRegNumber(),
	        		    booking.getCarBrand(),
	        		    booking.getCarModel()
	        	});
	        }
	        
        }
        tblBooking.setModel(model);
	}
}
