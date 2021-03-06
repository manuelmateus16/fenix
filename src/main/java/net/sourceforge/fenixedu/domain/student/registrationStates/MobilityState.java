package net.sourceforge.fenixedu.domain.student.registrationStates;

import java.util.HashSet;
import java.util.Set;

import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.student.Registration;

import org.joda.time.DateTime;

/**
 * 
 * @author - Shezad Anavarali (shezad@ist.utl.pt)
 * 
 */
public class MobilityState extends MobilityState_Base {

    protected MobilityState(Registration registration, Person person, DateTime dateTime) {
        super();
        init(registration, person, dateTime);
    }

    @Override
    public RegistrationStateType getStateType() {
        return RegistrationStateType.MOBILITY;
    }

    @Override
    public Set<String> getValidNextStates() {
        Set<String> states = new HashSet<String>();
        states.add(RegistrationStateType.CONCLUDED.name());
        states.add(RegistrationStateType.STUDYPLANCONCLUDED.name());
        states.add(RegistrationStateType.REGISTERED.name());
        states.add(RegistrationStateType.SCHOOLPARTCONCLUDED.name());
        states.add(RegistrationStateType.CANCELED.name());
        states.add(RegistrationStateType.INTERRUPTED.name());
        states.add(RegistrationStateType.FLUNKED.name());
        states.add(RegistrationStateType.INTERNAL_ABANDON.name());
        states.add(RegistrationStateType.EXTERNAL_ABANDON.name());
        return states;
    }

}
