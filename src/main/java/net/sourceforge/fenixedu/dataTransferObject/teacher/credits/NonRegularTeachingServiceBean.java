package net.sourceforge.fenixedu.dataTransferObject.teacher.credits;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.sourceforge.fenixedu.domain.NonRegularTeachingService;
import net.sourceforge.fenixedu.domain.Professorship;
import net.sourceforge.fenixedu.domain.Shift;
import net.sourceforge.fenixedu.domain.teacher.DegreeTeachingService;

public class NonRegularTeachingServiceBean implements Serializable {
    Professorship professorship;
    Shift shift;
    Double percentage;
    List<TeachingServicePercentage> teachingServicePercentages = new ArrayList<TeachingServicePercentage>();

    public class TeachingServicePercentage implements Serializable {
        String personName;
        Double percentage;

        public TeachingServicePercentage(String name, Double percentage) {
            setPersonName(name);
            setPercentage(percentage);
        }

        public String getPersonName() {
            return personName;
        }

        public void setPersonName(String personName) {
            this.personName = personName;
        }

        public Double getPercentage() {
            return percentage;
        }

        public void setPercentage(Double percentage) {
            this.percentage = percentage;
        }

    }

    public NonRegularTeachingServiceBean(Shift shift, Professorship professorship) {
        setProfessorship(professorship);
        setShift(shift);
        for (NonRegularTeachingService nonRegularTeachingService : shift.getNonRegularTeachingServices()) {
            if (nonRegularTeachingService.getProfessorship().equals(professorship)) {
                setPercentage(nonRegularTeachingService.getPercentage());
            }
            teachingServicePercentages.add(new TeachingServicePercentage(nonRegularTeachingService.getProfessorship().getPerson()
                    .getName(), nonRegularTeachingService.getPercentage()));
        }
        for (DegreeTeachingService degreeTeachingService : shift.getDegreeTeachingServices()) {
            teachingServicePercentages.add(new TeachingServicePercentage(degreeTeachingService.getProfessorship().getPerson()
                    .getName(), degreeTeachingService.getPercentage()));
        }
    }

    public Professorship getProfessorship() {
        return professorship;
    }

    public void setProfessorship(Professorship professorship) {
        this.professorship = professorship;
    }

    public Double getPercentage() {
        return percentage;
    }

    public void setPercentage(Double percentage) {
        this.percentage = percentage;
    }

    public Shift getShift() {
        return shift;
    }

    public void setShift(Shift shift) {
        this.shift = shift;
    }

    public List<TeachingServicePercentage> getTeachingServicePercentages() {
        return teachingServicePercentages;
    }

    public void setTeachingServicePercentages(List<TeachingServicePercentage> teachingServicePercentages) {
        this.teachingServicePercentages = teachingServicePercentages;
    }
}