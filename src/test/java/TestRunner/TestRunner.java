package TestRunner;

import com.intuit.karate.Results;
import org.junit.jupiter.api.Test;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestRunner {
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:TestCases")
//        Results results = Runner.path("classpath:TestCases/ProviderReport_FalseFlags.feature")
//        Results results = Runner.path("classpath:TestCases/ProviderReport_TrueFlags.feature")
//        Results results = Runner.path("classpath:TestCases/OrganizationReport_TrueFlags.feature")
//        Results results = Runner.path("classpath:TestCases/OrganizationReport_FalseFlags.feature")
//        Results results = Runner.path("classpath:TestCases/DEA_FullRestrict.feature")
//        Results results = Runner.path("classpath:TestCases/DEA_LimitedRestrict.feature")
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
