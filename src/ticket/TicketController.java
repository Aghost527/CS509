package ticket;

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
	

}
