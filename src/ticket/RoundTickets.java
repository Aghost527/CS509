package ticket;

public class RoundTickets {
	Tickets outboundTickets;
	Tickets returnTickets;
	private Double roundTripTotalPrice;
	private int roundTripTotalFlightMinute;
	
	
	public RoundTickets(Tickets outboundTickets,Tickets returnTickets){
		this.outboundTickets=outboundTickets;
		this.returnTickets=returnTickets;
		this.roundTripTotalFlightMinute=outboundTickets.getTotalFlightMinute()+returnTickets.getTotalFlightMinute();
		this.roundTripTotalPrice=outboundTickets.getTotalPrice()+returnTickets.getTotalPrice();
	}
	
	
	/**
	 * @return the outboundTickets
	 */
	public Tickets getOutboundTickets() {
		return outboundTickets;
	}
	/**
	 * @param outboundTickets the outboundTickets to set
	 */
	public void setOutboundTickets(Tickets outboundTickets) {
		this.outboundTickets = outboundTickets;
	}
	/**
	 * @return the returnTickets
	 */
	public Tickets getReturnTickets() {
		return returnTickets;
	}
	/**
	 * @param returnTickets the returnTickets to set
	 */
	public void setReturnTickets(Tickets returnTickets) {
		this.returnTickets = returnTickets;
	}
	/**
	 * @return the roundTripTotalPrice
	 */
	public Double getRoundTripTotalPrice() {
		return roundTripTotalPrice;
	}
	/**
	 * @param roundTripTotalPrice the roundTripTotalPrice to set
	 */
	public void setRoundTripTotalPrice(Double roundTripTotalPrice) {
		this.roundTripTotalPrice = roundTripTotalPrice;
	}
	/**
	 * @return the roundTripTotalFlightMinute
	 */
	public int getRoundTripTotalFlightMinute() {
		return roundTripTotalFlightMinute;
	}
	/**
	 * @param roundTripTotalFlightMinute the roundTripTotalFlightMinute to set
	 */
	public void setRoundTripTotalFlightMinute(int roundTripTotalFlightMinute) {
		this.roundTripTotalFlightMinute = roundTripTotalFlightMinute;
	}
	
	
	
}
