package ticket;

import java.util.ArrayList;
import java.util.List;

import flight.*;

public class TicketController {
	
	public static boolean validateFlights(Flights flist,String seatType){
		if(seatType.equals("Coach")){
		for(Flight f:flist){
			if(f.getSeating().getCoachRemaining()==0){
					return false;
				}
			}
		}
		else if(seatType.equals("First-Class")){
		for(Flight f:flist){
			if(f.getSeating().getFirstClassRemaining()==0){
					return false;
				}
			}
		}
		else {
			for(Flight f:flist){
				if(f.getSeating().getFirstClassRemaining()==0|f.getSeating().getCoachRemaining()==0){
						return false;
					}
				}			
		}
		
		return true;

	}
	
	public List<Tickets> noTicket(Flights flist, String seatType) {
		Double price=0.0;
		List<List<Ticket>> t=new ArrayList<List<Ticket>>();
        List<Ticket> tt = new ArrayList<Ticket>(); 
        t.add(new ArrayList<Ticket>(tt));
		
		for(int i=0;i<Math.pow(2, flist.size());i++){
			int types=i;
			boolean valid=true;
//			Tickets ts=new Tickets();
			for(Flight f:flist){
				if((types&1)==1){
					seatType = "First-Class";
					String tprice=f.getSeating().getFirstClassPrice().replace(",", "");
					price+=Double.valueOf(tprice.substring(1, tprice.length()));
			        tt.add(new Ticket(f.getAirplane(), f.getNumber(), f.getArrival(), f.getDeparture(), seatType, tprice, f.getFlightTime(), f.getDeTimeString(), f.getArTimeString()));
//			        t.add(new ArrayList<Ticket>(tt));	
				}
				else{
					seatType = "First-Class";
					String tprice=f.getSeating().getFirstClassPrice().replace(",", "");
					price+=Double.valueOf(tprice.substring(1, tprice.length()));
			        tt.add(new Ticket(f.getAirplane(), f.getNumber(), f.getArrival(), f.getDeparture(), seatType, tprice, f.getFlightTime(), f.getDeTimeString(), f.getArTimeString()));
//			        t.add(new ArrayList<Ticket>(tt));
				}
				types=types>>1;
		        t.add(new ArrayList<Ticket>(tt));

			}
			
		}
		
		long diff = (flist.get(flist.size()-1).getArrivalTime().getTime() - flist.get(0).getDepartureTime().getTime()) / 60000;
		return null;
		
		
	
}
	

}
