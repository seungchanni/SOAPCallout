public class AnimalLocator {
	public static String getAnimalNameById(Integer animalNumber) {
        String animalName;
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + animalNumber);
        request.setMethod('GET');
        
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String, Object>)results.get('animal');

            animalName = string.valueof(animal.get('name'));
        }

        return animalName;
    }
}