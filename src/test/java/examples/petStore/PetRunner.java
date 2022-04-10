package examples.petStore;

import com.intuit.karate.junit5.Karate;

public class PetRunner {
    @Karate.Test
    Karate testPetStore() {
        return Karate.run("findPetByID", "petStoreAPI").relativeTo(getClass());
    }
}
