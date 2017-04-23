package driver;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import airplane.Airplane;
import dao.ServerInterface;
import flight.Flight;
import flight.Flights;
import net.sf.json.JSONArray;
import ticket.RoundTickets;
import ticket.Ticket;
import ticket.TicketController;
import ticket.Tickets;
import utils.Saps;

public class DriverManager {

	public List<Flights> searchFlightsWithoutStop(Map<String, Airplane> airplanes, String departure, String time, String arrival,
			boolean isByDeparture) {
		List<Flights> flist = new ArrayList<Flights>();
		arrival = arrival.equals("") ? "RDU" : arrival;
		time = time.equals("") ? "2017_05_10" : time;
		departure = departure.equals("") ? "BOS" : departure;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT" + Saps.timeZoneMap.get(isByDeparture ? departure : arrival)));
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
		Flights flights = new Flights();
		flights = resSys.getFlightsFor2Days(airplanes,"TeamE", isByDeparture ? departure : arrival, time, isByDeparture);
		if (isByDeparture) {

			flights = flights.filterByArrival(arrival, flights);
		} else {

			flights = flights.filterByDeparture(departure, flights);
		}
		// System.out.println(flights.size() + "drivermanager");

		for (Flight f : flights) {

			if (isByDeparture && (f.getDepartureTime().before(d0) || f.getDepartureTime().after(d1))) {
				continue;
			}
			if ((!isByDeparture) && (f.getArrivalTime().before(d0) || f.getArrivalTime().after(d1))) {
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
	public List<Flights> searchFlightsWithOneStop(Map<String,Airplane> airplanes,String departure, String time, String arrival,
			boolean isByDeparture) {
		ServerInterface resSys = new ServerInterface();
		List<Flights> res = new ArrayList<Flights>();
		arrival = arrival.equals("") ? "RDU" : arrival;
		time = time.equals("") ? "2017_05_10" : time;
		departure = departure.equals("") ? "BOS" : departure;

		// if(isByDeparture){
		Flights flights1 = resSys.getFlightsFor3Days( airplanes,"TeamE", departure, time, true);// true
																						// means
																						// search
																						// by
																						// departure

		Flights flights2 = resSys.getFlightsFor2Days(airplanes,"TeamE", arrival, time, false);
		// flights2.sortByArrivalAirport();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT" + Saps.timeZoneMap.get(isByDeparture ? departure : arrival)));

		Date d0 = null, d1 = null;
		try {
			d0 = sdf.parse(time + " 00:00:00");
			d1 = sdf.parse(time + " 23:59:59");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (Flight f1 : flights1) {
			if (isByDeparture && f1.getDepartureTime().before(d0) | f1.getDepartureTime().after(d1)) {
				continue;
			}

			for (Flight f2 : flights2) {
				// System.out.println(f2.getDeparture());
				if ((!isByDeparture) && (f2.getArrivalTime().before(d0) || f2.getArrivalTime().after(d1))) {
					continue;
				}
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

	public List<Flights> searchFlightsWithTwoStop(Map<String,Airplane> airplanes,String departure, String time, String arrival,
			boolean isByDeparture) {
		ServerInterface resSys = new ServerInterface();
		List<Flights> res = new ArrayList<Flights>();
		HashMap<String, Flights> map = new HashMap<String, Flights>();
		arrival = arrival.equals("") ? "RDU" : arrival;
		time = time.equals("") ? "2017_05_10" : time;
		departure = departure.equals("") ? "BOS" : departure;

		// Flights flights1 =
		// resSys.getFlightsFor2Days("TeamE","PHL","2017_05_10",true);
		Flights flights1 = resSys.getFlightsFor3Days( airplanes,"TeamE", departure, time, true);// true
																						// means
																						// search
																						// by
																						// departure
		// flights1.sortByArrivalAirport();

		// Flights flights3 =
		// resSys.getFlightsFor2Days("TeamE","RDU","2017_05_10",false);
		Flights flights3 = resSys.getFlightsFor2Days( airplanes,"TeamE", arrival, time, false);
		flights3.sortByArrivalAirport();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT" + Saps.timeZoneMap.get(isByDeparture ? departure : arrival)));

		Date d0 = null, d1 = null;
		try {
			d0 = sdf.parse(time + " 00:00:00");
			d1 = sdf.parse(time + " 23:59:59");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (Flight f1 : flights1) {
			if (isByDeparture && f1.getDepartureTime().before(d0) | f1.getDepartureTime().after(d1)) {
				continue;
			}

			if (!map.containsKey(f1.getArrival())) {
				map.put(f1.getArrival(), resSys.getFlightsFor2Days( airplanes,"TeamE", f1.getArrival(), time, true));
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
						if ((!isByDeparture) && (f3.getArrivalTime().before(d0) || f3.getArrivalTime().after(d1))) {
							continue;
						}
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
		String xmlFlights = flights2xml(flist, seatType);
		boolean isLocked;
		boolean buySuccess;
		
		do{
			isLocked = resSys.lock(teamName); // is locked DB
		}while(!isLocked); // if DB is locked by teamName, then go to reserve tickets.
		
		buySuccess = resSys.buyTickets(teamName, xmlFlights);
		resSys.unlock(teamName);
		return buySuccess;
		
	}
	
	public boolean buyTicket(Tickets tlist, String teamName) {
		ServerInterface resSys = new ServerInterface();
		String xmlFlights = tickets2xml(tlist);
		boolean isLocked;
		boolean buySuccess;
		
		do{
			isLocked = resSys.lock(teamName); // is locked DB
		}while(!isLocked);
		
		buySuccess = resSys.buyTickets(teamName, xmlFlights);
		resSys.unlock(teamName);
		return buySuccess;
		
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
			res += "<Flight number=" + "\"" +f.getNumber()+"\"" + " seating=" + "\""+seatType+"\"" + "/>";
		}
		return res + "</Flights>";

	}
	
	public String tickets2xml(Tickets tlist) {
		String res = "<Flights>";
		for (Ticket t : tlist.getTicketList()) {
			res += "<Flight number=" + "\"" +t.getNumber()+"\"" + " seating=" + "\""+t.getSeatType()+"\"" + "/>";
		}
		return res + "</Flights>";

	}

	public JSONArray search(String tripType, String seatType, String departure, String date, String arrival,
			String timeType, String returndate,String returntimeType) {
		List<Flights> flightlis = new ArrayList<Flights>();
		List<Tickets> tlist = new ArrayList<Tickets>();
		JSONArray jsonArray = null;
		DriverManager driverManager = new DriverManager();
		boolean isByDeparture = timeType.equals("Departure") ? true : false;
		boolean isByDeparture2 = returntimeType.equals("Departure") ? true : false;
		arrival = arrival.equals("") | arrival.equals(null) | arrival.equals("null") | arrival == null ? "RDU"
				: arrival;
		date = date.equals("") | date.equals(null) | date.equals("null") | date == null ? "2017_05_10" : date;
		returndate = returndate.equals("") | returndate.equals(null) | returndate.equals("null") | returndate == null
				? "2017_05_11" : returndate;
		departure = departure.equals("") | departure.equals(null) | departure.equals("null") | departure == null ? "BOS"
				: departure;
		seatType = seatType.equals("") | seatType.equals(null) | seatType.equals("null") | seatType == null ? "Coach"
				: seatType;
		
		//create airplane map
		Map<String, Airplane> airplanes = new ServerInterface().getAirplanes("TeamE");
		
		//generate outbound trips
		flightlis.addAll(driverManager.searchFlightsWithoutStop(airplanes,departure, date, arrival, isByDeparture));

		flightlis.addAll(driverManager.searchFlightsWithOneStop(airplanes,departure, date, arrival, isByDeparture));

		flightlis.addAll(driverManager.searchFlightsWithTwoStop(airplanes,departure, date, arrival, isByDeparture));
		
		

		
		//generate return trips
		if(tripType.equals("RoundTrip")|tripType.equals("Roundtrip")|tripType.equals("Round_Trip")|tripType.equals("roundtrip")){
			List<RoundTickets> rlist = new ArrayList<RoundTickets>();
			List<Flights> flightlis2 = new ArrayList<Flights>();
			
			flightlis2.addAll(driverManager.searchFlightsWithoutStop(airplanes,arrival, returndate, departure, isByDeparture2));

			flightlis2.addAll(driverManager.searchFlightsWithOneStop(airplanes,arrival, returndate, departure, isByDeparture2));

			flightlis2.addAll(driverManager.searchFlightsWithTwoStop(airplanes,arrival, returndate, departure, isByDeparture2));
			
			//return should be later than outbound
			for (Flights f1 : flightlis) {
				if (!TicketController.validateFlights(f1, seatType)){
					continue;
				}
				for (Flights f2 : flightlis2) {
					if (!TicketController.validateFlights(f2, seatType)){
						continue;
					}
					if(f1.get(f1.size()-1).getArrivalTime().before(f2.get(0).getDepartureTime())){
						rlist.add(new RoundTickets(new Tickets(f1,seatType),new Tickets(f2,seatType)));
					}
				}
			}
			jsonArray=JSONArray.fromObject(rlist);
		}
		
		
		//or generate one-way tickets
		else{
			for (Flights f : flightlis) {
				if (TicketController.validateFlights(f, seatType)) {
//					airplanes.get()
					tlist.add(new Tickets(f, seatType));
				}
			}
			
			jsonArray=JSONArray.fromObject(tlist);
		}
		
		
		 System.out.println("json: "+jsonArray);
		return jsonArray;

	}

}
