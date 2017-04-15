package driver;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

import dao.ServerInterface;
import flight.Flight;
import flight.Flights;
import net.sf.json.JSONArray;
import utils.Saps;

public class DriverManager {

	public List<Flights> searchFlightsWithoutStop(String departure, String time, String arrival) {
		List<Flights> flist = new ArrayList<Flights>();
		arrival = arrival.equals("") ? "RDU" : arrival;
		time = time.equals("") ? "2017_05_09" : time;
		departure = departure.equals("") ? "BOS" : departure;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT" + Saps.timeZoneMap.get(departure)));
		Date d0 = null, d1 = null;
		try {
			d0 = sdf.parse(time + " 00:00:00");
			d1 = sdf.parse(time + " 23:59:59");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ServerInterface resSys = new ServerInterface();
		// Flights flights = resSys.getFlighs("TeamE","BOS","2017_05_10",true);
		Flights flights = resSys.getFlightsFor2Days("TeamE", departure, time, true);
		flights.sortByArrivalAirport();
		flights = flights.filterByArrival(arrival, flights);
		for (Flight f : flights) {
			// if(f.getDepartureTime().before(arg0))
			if (f.getDepartureTime().before(d0) | f.getDepartureTime().after(d1)) {
				continue;
			}
			Flights tmp = new Flights();
			tmp.add(f);
			flist.add(tmp);
		}
		return flist;

	}

	/*
	 * for the time being, it can only search flight within one day
	 */
	public List<Flights> searchFlightsWithOneStop(String departure, String time, String arrival) {
		ServerInterface resSys = new ServerInterface();
		List<Flights> res = new ArrayList<Flights>();
		arrival = arrival.equals("") ? "RDU" : arrival;
		time = time.equals("") ? "2017_05_09" : time;
		departure = departure.equals("") ? "BOS" : departure;

		// Flights flights1 =
		// resSys.getFlightsFor2Days("TeamE","PHL","2017_05_10",true);
		Flights flights1 = resSys.getFlightsFor2Days("TeamE", departure, time, true);// true
																						// means
																						// search
																						// by
																						// departure
		flights1.sortByArrivalAirport();
		System.out.println(flights1.size());

		// Flights flights2 =
		// resSys.getFlightsFor2Days("TeamE","RDU","2017_05_10",false);
		Flights flights2 = resSys.getFlightsFor2Days("TeamE", arrival, time, false);
		flights2.sortByArrivalAirport();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT" + Saps.timeZoneMap.get(departure)));

		Date d0 = null, d1 = null;
		try {
			d0 = sdf.parse(time + " 00:00:00");
			d1 = sdf.parse(time + " 23:59:59");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (Flight f1 : flights1) {
			if (f1.getDepartureTime().before(d0) | f1.getDepartureTime().after(d1)) {
				continue;
			}

			for (Flight f2 : flights2) {
//				System.out.println(f2.getDeparture());
				if (f1.getArrival().equals(f2.getDeparture()) & f1.getArrivalTime().before(f2.getDepartureTime())) {
					long diff = f2.getDepartureTime().getTime() - f1.getArrivalTime().getTime();
					long minutes = diff / (1000 * 60);
					if (minutes > 240 | minutes < 30) {
						continue;
					}
					Flights flight = new Flights();
					flight.add(f1);
					flight.add(f2);
					res.add(flight);
				}
			}
		}
		System.out.println("res size:" + res.size());
		// Flights flights2 =

		return res;

	}

	public List<Flights> searchFlightsWithTwoStop(String departure, String time, String arrival) {
		ServerInterface resSys = new ServerInterface();
		List<Flights> res = new ArrayList<Flights>();
		HashMap<String, Flights> map = new HashMap<String, Flights>();
		arrival = arrival.equals("") ? "RDU" : arrival;
		time = time.equals("") ? "2017_05_09" : time;
		departure = departure.equals("") ? "BOS" : departure;

		// Flights flights1 =
		// resSys.getFlightsFor2Days("TeamE","PHL","2017_05_10",true);
		Flights flights1 = resSys.getFlightsFor2Days("TeamE", departure, time, true);// true
																						// means
																						// search
																						// by
																						// departure
		// flights1.sortByArrivalAirport();

		// Flights flights3 =
		// resSys.getFlightsFor2Days("TeamE","RDU","2017_05_10",false);
		Flights flights3 = resSys.getFlightsFor2Days("TeamE", arrival, time, false);
		flights3.sortByArrivalAirport();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT" + Saps.timeZoneMap.get(departure)));

		Date d0 = null, d1 = null;
		try {
			d0 = sdf.parse(time + " 00:00:00");
			d1 = sdf.parse(time + " 23:59:59");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (Flight f1 : flights1) {
			if (f1.getDepartureTime().before(d0) | f1.getDepartureTime().after(d1)) {
				continue;
			}

			if (!map.containsKey(f1.getArrival())) {
				map.put(f1.getArrival(), resSys.getFlightsFor2Days("TeamE", f1.getArrival(), time, true));
			}
			// System.out.println(map.get(f1.getArrival()).size()+"len");
			for (Flight f2 : map.get(f1.getArrival())) {
				if (f2.getDepartureTime().after(f1.getArrivalTime())) { // f2.departTime>f1.arrivalTime
					long diff12 = (f2.getDepartureTime().getTime() - f1.getArrivalTime().getTime()) / 60000; // 60000ms==1
																												// min
					if (diff12 > 240 | diff12 < 30) {
						continue;
					}

					for (Flight f3 : flights3) {
						if (f3.getDeparture().equals(f2.getArrival())
								& f3.getDepartureTime().after(f2.getDepartureTime())) {
							long diff23 = (f3.getDepartureTime().getTime() - f2.getArrivalTime().getTime()) / 60000; // 60000ms==1
																														// min

							if (diff23 > 240 | diff23 < 30) {
								continue;
							}
							Flights flight = new Flights();
							flight.add(f1);
							flight.add(f2);
							flight.add(f3);
							res.add(flight);

						}
					}
				}
			}

		}

		System.out.println("res size:" + res.size());
		// Flights flights2 =

		return res;

	}

	public boolean buyTicket(Flights flist, String seatType, String teamName) {
		ServerInterface resSys = new ServerInterface();

		resSys.lock(teamName);
		String xmlFlights = flights2xml(flist, seatType);
		resSys.buyTickets(teamName, xmlFlights);
		return resSys.unlock(teamName);
	}

	/**
	 * <Flights> <Flight number=DDDDD seating=SEAT_TYPE/> <Flight number=DDDDD
	 * seating=SEAT_TYPE/> </Flights>
	 * 
	 * @param flist
	 * @param seatType
	 * @return
	 */
	public String flights2xml(Flights flist, String seatType) {
		String res = "<Flights>";
		for (Flight f : flist) {
			res += "<Flight number=" + f.getNumber() + " seating=" + seatType + "/>";
		}
		return res + "</Flights>";

	}

	public JSONArray search(String tripType, String seatType, String departure,  String date,String arrival) {
		List<Flights> flightlis = new ArrayList<Flights>();
		DriverManager driverManager = new DriverManager();
		
		arrival = arrival.equals("")|arrival.equals(null)|arrival.equals("null")|arrival==null ? "RDU" : arrival;
		date = date.equals("")|date.equals(null)|date.equals("null")|date==null ? "2017_05_09" : date;
		departure = departure.equals("")|departure.equals(null)|departure.equals("null")|departure==null ? "BOS" : departure;
		
		
		flightlis.addAll(driverManager.searchFlightsWithoutStop(arrival, date, departure));

		flightlis.addAll(driverManager.searchFlightsWithOneStop(arrival, date, departure));

		flightlis.addAll(driverManager.searchFlightsWithTwoStop(arrival, date, departure));

		JSONArray jsonArray = JSONArray.fromObject(flightlis);
		System.out.println(jsonArray);
		return jsonArray;

	}

}
