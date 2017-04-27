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
	
	public static List<Tickets> noTicket(Flights flist) {
		Double price=0.0;
		String seatType;
		List<Tickets> tslist=new ArrayList<Tickets>();
		long diff = (flist.get(flist.size()-1).getArrivalTime().getTime() - flist.get(0).getDepartureTime().getTime()) / 60000;
		String totalFlightTime = (diff/60)+"h " +(diff%60)+"m";
        int totalFlightMinute=(int)diff;
		
		for(int i=0;i<Math.pow(2, flist.size());i++){
			List<Ticket> tlist = new ArrayList<Ticket>(); 
			int types=i;
			
			for(Flight f:flist){
				if((types&1)==1){
					if(f.getSeating().getFirstClassRemaining()<1)break;
					seatType = "First-Class";
					String tprice=f.getSeating().getFirstClassPrice().replace(",", "");
					price+=Double.valueOf(tprice.replace(",","").replace("$",""));
					tlist.add(new Ticket(f.getAirplane(), f.getNumber(), f.getArrival(), f.getDeparture(), seatType, tprice, f.getFlightTime(), f.getDeTimeString(), f.getArTimeString()));
	
				}
				else{
					if(f.getSeating().getCoachRemaining()<1)break;
					seatType = "Coach";
					String tprice=f.getSeating().getCoachPrice().replace(",", "");
					price+=Double.valueOf(tprice.replace(",","").replace("$",""));
					tlist.add(new Ticket(f.getAirplane(), f.getNumber(), f.getArrival(), f.getDeparture(), seatType, tprice, f.getFlightTime(), f.getDeTimeString(), f.getArTimeString()));

				}
				types=types>>1;
		        
			}
			if(tlist.size()==flist.size())tslist.add(new Tickets(tlist, totalFlightTime, totalFlightMinute));
			
		}
		
		
		return tslist;
		
		
	
}
	

}
