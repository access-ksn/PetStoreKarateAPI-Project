package examples.users;

import com.intuit.karate.junit5.Karate;

public class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users", "json", "getAPI", "firstExample", "randomemail").relativeTo(getClass());
    }    

}
