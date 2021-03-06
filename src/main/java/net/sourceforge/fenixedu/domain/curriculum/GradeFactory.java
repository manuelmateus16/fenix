package net.sourceforge.fenixedu.domain.curriculum;

import net.sourceforge.fenixedu.domain.GradeScale;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;

import org.apache.commons.lang.StringUtils;

class Grade implements IGrade {
    private Object gradeValue;

    private GradeType gradeType;

    public Grade(int grade) {
        initNumeric(grade);
    }

    public Grade(String grade) {
        if (grade == null || grade.equals("") || grade.equals(GradeScale.NA)) {
            this.gradeValue = GradeScale.NA;
            this.gradeType = GradeType.GRADENA;
        } else if (StringUtils.isNumeric(grade)) {
            Integer numericGrade = Integer.parseInt(grade);
            initNumeric(numericGrade);
        } else if (grade.equals(GradeScale.AP)) {
            this.gradeValue = grade;
            this.gradeType = GradeType.GRADEAP;
        } else {
            this.gradeValue = GradeScale.RE;
            this.gradeType = GradeType.GRADERE;
        }
    }

    protected void initNumeric(int grade) {
        this.gradeValue = grade;

        if (grade <= 5) {
            this.gradeType = GradeType.GRADEFIVE;
        } else {
            this.gradeType = GradeType.GRADETWENTY;
        }
    }

    @Override
    public Object getGradeValue() {
        return gradeValue;
    }

    @Override
    public GradeType getGradeType() {
        return gradeType;
    }

    // very important: don't change this
    @Override
    public int compareTo(IGrade o) {
        if (this.getGradeType() == o.getGradeType()) {
            if (this.getGradeType() == GradeType.GRADEFIVE || this.getGradeType() == GradeType.GRADETWENTY) {
                Integer grade1 = (Integer) this.getGradeValue();
                Integer grade2 = (Integer) o.getGradeValue();
                return grade1.compareTo(grade2);
            } else {
                return 0;
            }
        }
        if (this.getGradeType() == GradeType.GRADENA || this.getGradeType() == GradeType.GRADERE) {
            return 1;
        }
        if (o.getGradeType() == GradeType.GRADENA || o.getGradeType() == GradeType.GRADERE) {
            return -1;
        }

        throw new DomainException("error.grade.different.grade.types");
    }

}

public class GradeFactory {
    private static GradeFactory instance = new GradeFactory();

    private IGrade[] flyWeight;

    private GradeFactory() {
        flyWeight = new IGrade[24];

        flyWeight[21] = new Grade(GradeScale.RE);
        flyWeight[22] = new Grade(GradeScale.NA);
        flyWeight[23] = new Grade(GradeScale.AP);

        for (int i = 0; i < 21; i++) {
            flyWeight[i] = new Grade(i);
        }
    }

    public IGrade getGrade(String key) {
        return flyWeight[getGradePosition(key)];
    }

    public IGrade getGrade(int key) {
        return flyWeight[key];
    }

    private int getGradePosition(String key) {
        if (key == null || key.equals("") || key.equals(GradeScale.NA)) {
            return 22;
        }

        if (key.equals(GradeScale.RE)) {
            return 21;
        }

        if (key.equals(GradeScale.AP)) {
            return 23;
        }

        return Integer.parseInt(key);
    }

    public static GradeFactory getInstance() {
        return instance;
    }
}
