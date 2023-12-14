@isTest
public class ParkLocatorTest {
    @istest static void testParkLocator(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] result = ParkLocator.country('United States');

        List<string> parksNames = new List<String>{'Garner State Park', 'Fowler Park', 'Hoosier National Forest Park'};

        System.assertEquals(parksNames, result);
    }
}