import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testPet() {
        // This will run all .feature files in the same package
        return Karate.run("pet").relativeTo(getClass());
    }

}