package ticket;

import java.util.ArrayList;
import java.util.List;

import flight.Flight;
import flight.Flights;

public class Tickets  {
	private List<Ticket> ticketList;
	private Double totalPrice;
	private String totalFlightTime;
	private String SeatType;
	private String deTimeString;
	private String arTimeString;

	
	
	/**
	 * @param ticketList
	 * @param totalPrice
	 * @param totalFlightTime
	 * @param seatType
	 * @param deTimeString
	 * @param arTimeString
	 */
	public Tickets(List<Ticket> ticketList, Double totalPrice, String totalFlightTime, String seatType,
			String deTimeString, String arTimeString) {
		super();
		this.ticketList = ticketList;
		this.totalPrice = totalPrice;
		this.totalFlightTime = totalFlightTime;
		SeatType = seatType;
		this.deTimeString = deTimeString;
		this.arTimeString = arTimeString;
	}

	/**
	 * @param t
	 * @param totalPrice
	 * @param totalFlightTime
	 * @param seatType
	 */
	public Tickets(Flights flist, String seatType) {
		Double price=0.0;
		List<Ticket> t=new ArrayList<Ticket>();
		if(seatType.equals("Coach")){
			for(Flight f:flist){
				String tprice=f.getSeating().getCoachPrice();
				price+=Double.valueOf(tprice.substring(1, tprice.length()));
			}
			
		}
		else if(seatType.equals("First-Class")){
			for(Flight f:flist){
				String tprice=f.getSeating().getFirstClassPrice();
				price+=Double.valueOf(tprice.substring(1, tprice.length()));
			}
		}
		else{
			
		}
		long diff = (flist.get(flist.size()-1).getArrivalTime().getTime() - flist.get(0).getDepartureTime().getTime()) / 60000;
		
		this.totalPrice = price;
		this.totalFlightTime = (diff/60)+"h " +(diff%60)+"m";
		this.setDeTimeString(flist.get(0).getDeTimeString());
		this.setArTimeString(flist.get(flist.size()-1).getArTimeString());
	}

	
	/**
	 * @return the totalPrice
	 */
	public Double getTotalPrice() {
		return totalPrice;
	}
	/**
	 * @param totalPrice the totalPrice to set
	 */
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	/**
	 * @return the totalFlightTime
	 */
	public String getTotalFlightTime() {
		return totalFlightTime;
	}
	/**
	 * @param totalFlightTime the totalFlightTime to set
	 */
	public void setTotalFlightTime(String totalFlightTime) {
		this.totalFlightTime = totalFlightTime;
	}
	/**
	 * @return the seatType
	 */
	public String getSeatType() {
		return SeatType;
	}
	/**
	 * @param seatType the seatType to set
	 */
	public void setSeatType(String seatType) {
		SeatType = seatType;
	}

	/**
	 * @return the ticketList
	 */
	public List<Ticket> getTicketList() {
		return ticketList;
	}

	/**
	 * @param ticketList the ticketList to set
	 */
	public void setTicketList(List<Ticket> ticketList) {
		this.ticketList = ticketList;
	}

	/**
	 * @return the deTimeString
	 */
	public String getDeTimeString() {
		return deTimeString;
	}

	/**
	 * @param deTimeString the deTimeString to set
	 */
	public void setDeTimeString(String deTimeString) {
		this.deTimeString = deTimeString;
	}

	/**
	 * @return the arTimeString
	 */
	public String getArTimeString() {
		return arTimeString;
	}

	/**
	 * @param arTimeString the arTimeString to set
	 */
	public void setArTimeString(String arTimeString) {
		this.arTimeString = arTimeString;
	}
	
	
	
	
}
