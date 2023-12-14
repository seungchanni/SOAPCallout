public class ParkLocator {
    public static String[] country(String country){

        ParkService.ParksImplPort parkNames = new ParkService.ParksImplPort();
        return parkNames.byCountry(country);
    }
}